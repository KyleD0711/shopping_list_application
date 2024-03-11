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
              List ingredients = e.data()[_ingredients];
              return Recipe(
                  id: e.id,
                  ingredients: List<Map<String, String>>.from(ingredients.map((e) => Map<String, String>.from(e))),
                  recipes: List<Recipe>.from(e.data()[_recipes]),
                  prepTimeInMinutes: e.data()[_prepTimeInMinutes],
                  cookTimeInMinutes: e.data()[_cookTimeInMinutes],
                  name: e.data()[_name],
                  description: e.data()[_description],
                  instructions: e.data()[_instructions]);
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
