import 'package:cloud_firestore_odm/annotation.dart';
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

  Future<String?> generateShoppingList(String weekId, String? name) async {
    WeekDocumentSnapshot weekRef = await WeekService().getWeek(weekId).get();
    Week? week = weekRef.data;

    try {
      if (week == null) throw Exception("Can't get week with id = $weekId");

      Map<String, int> recipeMap = <String, int>{};

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

      Map<String, Quantity> ingredientMap = <String, Quantity>{};
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

          ingredientMap.addEntries([
            MapEntry(ingredientName, Quantity.parseFromString(ingredientQty).multiply(multiplier))
          ]);
        }

        // Create new shopping list and add it to Firebase
        ShoppingList newShoppingList = ShoppingList(
            name:
                name ?? "${formatDate(week.beginDate)} - ${formatDate(week.endDate)}",
                beginDate: week.beginDate, endDate: week.endDate);

        shoppingLists = ShoppingListService().getShoppingLists();
        ShoppingListDocumentSnapshot shoppingListRef =
            await shoppingLists.doc(newShoppingList.id).get();
        shoppingListRef.reference.set(newShoppingList);

        ingredientMap.forEach((key, value) {
          shoppingListRef.reference.shoppinglistitems.add(ShoppingListItem(
              item: key, quantity: value.toString(), isSelected: false));
        });

        return null;
      });
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
