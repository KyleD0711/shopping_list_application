import 'package:cloud_firestore_odm/annotation.dart';
import 'package:fraction/fraction.dart';
import 'package:shopping_list_application/models/quantity.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/services/auth.dart';
import 'package:shopping_list_application/services/recipe_service.dart';
import 'package:shopping_list_application/services/user_service.dart';
import 'package:shopping_list_application/services/week_service.dart';
import 'package:shopping_list_application/utils/date_helpers.dart';
import 'package:shopping_list_application/utils/measurement_helpers.dart';
import 'package:shopping_list_application/utils/validators/model/model_validator.dart';

class ShoppingListService {
  @Collection<ShoppingList>('users/*/shoppinglists')
  ShoppingListCollectionReference shoppingLists =
      UserService.usersRef.doc(Auth().userId).shoppinglists;

  ShoppingListCollectionReference getShoppingLists() {
    return shoppingLists;
  }

  ShoppingListDocumentReference getShoppingList(String id) {
    return shoppingLists.doc(id);
  }

  Future<String?> generateShoppingList(
      List<String> weekIds, String? name) async {
    try {
      if (weekIds.isEmpty) throw Exception("List of ids can't be empty");

      WeekDocumentSnapshot weekRef =
          await WeekService().getWeek(weekIds.first).get();

      if (!weekRef.exists) {
        throw Exception("Can't find week with id: ${weekIds.first}");
      }

      DateTime startDate = weekRef.data!.beginDate;
      DateTime endDate = weekRef.data!.endDate;

      Map<String, Quantity> ingredientWithMeasureMap = <String, Quantity>{};
      Map<String, Quantity> ingredientWithoutMeasureMap = <String, Quantity>{};

      for (String id in weekIds) {
        WeekDocumentSnapshot weekRef = await WeekService().getWeek(id).get();
        if (!weekRef.exists) throw Exception("Can't find week with id: $id");

        // Get week data
        Week? week = weekRef.data;

        if (week!.beginDate.isBefore(startDate)) startDate = week.beginDate;
        if (week.endDate.isAfter(endDate)) endDate = week.endDate;

        // Gets the multipliers of how many servings a recipe has
        Map<String, int> recipeMap = getNumberOfRecipes(week);

        // Process week of recipes
        for (int i = 0; i < recipeMap.length; i++) {
          Recipe? recipe =
              await RecipeService().getRecipeByName(recipeMap.keys.toList()[i]);

          if (recipe == null) continue;

          int multiplier = recipeMap.values.toList()[i];

          for (var ingredient in recipe.ingredients) {
            String? ingredientName = ingredient['name'];
            String? ingredientQty = ingredient['qty'];

            if (ingredientName == null ||
                validateQuantity(ingredientQty) != null ||
                ingredientQty == null /**Redundant*/) {
              throw Exception(
                  "Data is invalid for $ingredient in recipe $recipe");
            }

            Quantity quantity = Quantity.parseFromString(ingredientQty);

            // If both quantities are not null, then they need to be added together
            // If this is a new ingredient, then the ingredient should be added to the list
            // If the ingredient exists in the list but the quantity trying to be added doesn't have a measurement,
            //  then it should just be concatenated with the list

            if (quantity.measurement == "") {
              if (ingredientWithoutMeasureMap[ingredientName] != null) {
                ingredientWithoutMeasureMap[ingredientName]!.amount =
                    getNewAmount(
                        ingredientWithoutMeasureMap[ingredientName]!, quantity);
              } else {
                ingredientWithoutMeasureMap.addEntries([
                  MapEntry(
                      ingredientName,
                      Quantity.parseFromString(ingredientQty)
                          .multiply(multiplier))
                ]);
              }
            } else {
              if (ingredientWithMeasureMap[ingredientName] != null &&
                  quantity.measurement != "") {
                Rational newAmount = getNewAmount(
                    ingredientWithMeasureMap[ingredientName]!, quantity);

                ingredientWithMeasureMap[ingredientName]!.amount = newAmount;
              } else {
                ingredientWithMeasureMap.addEntries([
                  MapEntry(
                      ingredientName,
                      Quantity.parseFromString(ingredientQty)
                          .multiply(multiplier))
                ]);
              }
            }
          }
        }
      }

      ShoppingList newList = ShoppingList(
          name: name == "" || name == null
              ? "${formatDate(startDate)} - ${formatDate(endDate)}"
              : name,
          beginDate: startDate,
          endDate: endDate);

      ingredientWithMeasureMap.forEach(
        (key, value) => newList.shoppingListItems
            .add({"name": key, "qty": value.toString(), "isSelected": "false"}),
      );

      ingredientWithoutMeasureMap.forEach(
        (key, value) => newList.shoppingListItems
            .add({"name": key, "qty": value.toString(), "isSelected": "false"}),
      );

      newList.shoppingListItems
          .sort((a, b) => a['name']!.compareTo(b['name']!));

      await shoppingLists.add(newList);
    } on Exception catch (e) {
      return e.toString();
    }

    return "Shopping list created successfully!";
  }

  Rational getNewAmount(Quantity ingredient1, Quantity ingredient2) {
    Rational amount1 = ingredient1.amount;
    String measurement1 = ingredient1.measurement;
    Rational amount2 = ingredient2.amount;
    String measurement2 = ingredient2.measurement;
    Rational newAmount;

    measurement1 = getStandardMeasurement(measurement1);
    measurement2 = getStandardMeasurement(measurement2);

    if (measurement1 == measurement2) {
      return (amount1.toDouble() + amount2.toDouble()).toFraction().reduce();
    }

    if (getLargerMeasurement(measurement1, measurement2) == 0) {
      newAmount = addMeasurements(ingredient1, ingredient2);
    } else {
      newAmount = addMeasurements(ingredient2, ingredient1);
    }

    return newAmount;
  }

  Map<String, int> getNumberOfRecipes(Week? week) {
    Map<String, int> recipeMap = <String, int>{};

    if (week == null) throw Exception("Can't get week");
    // Get the number of recipes that are in the week
    for (var day in week.days.values) {
      for (var recipe in day) {
        String? name = recipe['name'];
        String? qty = recipe['qty'];

        if (name == null) continue;
        if (validateQuantity(qty) != null || qty == null) {
          throw Exception("Qty data is invalid in recipe $recipe:$qty");
        }

        if (recipeMap.keys.contains(name)) {
          recipeMap[name] = int.tryParse(qty)! + recipeMap[name]!;
        } else {
          recipeMap.addEntries([MapEntry(name, int.tryParse(qty)!)]);
        }
      }
    }

    return recipeMap;
  }
}
