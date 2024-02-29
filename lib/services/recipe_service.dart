import "package:shopping_list_application/models/ingredient.dart";
import "package:shopping_list_application/models/recipe.dart";
import "package:shopping_list_application/services/auth.dart";
import "./firestore_storage.dart";

class RecipeService {
  static const _users = 'users';
  static const _recipes = 'recipes';
  static const _ingredients = 'ingredients';
  static const _prepTimeInMinutes = 'prepTimeInMinutes';
  static const _cookTimeInMinutes = 'cookTimeInMinutes';
  static const _name = 'name';
  static const _description = 'description';
  static const _instructions = 'instructions';

  Stream<List<Recipe>> getRecipes() {
    return FirestoreStorage.database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_recipes)
        .snapshots()
        .map((event) => event.docs.map((e) {
              print(e.data());
              return Recipe(
                  e.id,
                  Map<Ingredient, String>.from(e.data()[_ingredients]),
                  List<Recipe>.from(e.data()[_recipes]),
                  e.data()[_prepTimeInMinutes],
                  e.data()[_cookTimeInMinutes],
                  e.data()[_name],
                  e.data()[_description],
                  e.data()[_instructions]);
            }).toList());
  }

  Future<void> insertRecipe(
      Map<Ingredient, String> ingredients,
      List<Recipe> recipes,
      int prepTimeInMinutes,
      int cookTimeInMinutes,
      String name) {
    final data = {
      "ingredients": ingredients,
      "recipes": recipes.toList(),
      "prepTimeInMinutes": prepTimeInMinutes,
      "cookTimeInMinutes": cookTimeInMinutes,
      "name": name
    };

    return FirestoreStorage.database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_recipes)
        .add(data);
  }

  Future<void> removeRecipe(Recipe recipe) {
    return FirestoreStorage.database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_recipes)
        .doc(recipe.id)
        .delete();
  }
}
