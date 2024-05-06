import 'package:cloud_firestore_odm/annotation.dart';
import 'package:fraction/fraction.dart';
import 'package:shopping_list_application/models/quantity.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/services/auth.dart';
import 'package:shopping_list_application/services/recipe_service.dart';
import 'package:shopping_list_application/services/user_service.dart';
import 'package:shopping_list_application/services/week_service.dart';
import 'package:shopping_list_application/utils/date_helpers.dart';
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
    Map<String, Quantity> ingredientMap = <String, Quantity>{};
    try {
      if (weekIds.isEmpty) throw Exception("List of ids can't be empty");

      WeekDocumentSnapshot weekRef =
          await WeekService().getWeek(weekIds.first).get();
      if (!weekRef.exists)
        throw Exception("Can't find week with id: ${weekIds.first}");
      DateTime startDate = weekRef.data!.beginDate;
      DateTime endDate = weekRef.data!.endDate;

      for (String id in weekIds) {
        WeekDocumentSnapshot weekRef = await WeekService().getWeek(id).get();
        if (!weekRef.exists) throw Exception("Can't find week with id: $id");

        Week? week = weekRef.data;
        if (week!.beginDate.isBefore(startDate)) startDate = week.beginDate;
        if (week.endDate.isAfter(endDate)) endDate = week.endDate;

        Map<String, int> recipeMap = getNumberOfRecipes(week);

        recipeMap.forEach((recipeName, multiplier) async {
          Recipe recipe = await RecipeService().getRecipeByName(recipeName);
          for (var ingredient in recipe.ingredients) {
            String? ingredientName = ingredient['name'];
            String? ingredientQty = ingredient['qty'];

            if (ingredientName == null ||
                !validateQuantity(ingredientQty) ||
                ingredientQty == null /**Redundant*/) {
              throw Exception(
                  "Data is invalid for $ingredient in recipe $recipe");
            }

            if (ingredientMap[ingredientName] != null) {
              ingredientMap[ingredientName]!.amount =
                  (ingredientMap[ingredientName]!.amount.toDouble() +
                          Quantity.parseFromString(ingredientQty)
                              .multiply(multiplier)
                              .amount
                              .toDouble())
                      .toFraction()
                      .reduce();
            } else {
              ingredientMap.addEntries([
                MapEntry(
                    ingredientName,
                    Quantity.parseFromString(ingredientQty)
                        .multiply(multiplier))
              ]);
            }
          }
        });
      }
      ShoppingList newList = ShoppingList(
          name: name ?? "${formatDate(startDate)} - ${formatDate(endDate)}",
          beginDate: startDate,
          endDate: endDate);
      
      ingredientMap.forEach((key, value) => newList.shoppingListItems.add({"name": key, "qty": value.toString(), "isSelected": false}),);

      await shoppingLists.add(newList);
    } on Exception catch (e) {
      return e.toString();
    }
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
        if (!validateQuantity(qty) || qty == null) {
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
