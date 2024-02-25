import "package:cloud_firestore/cloud_firestore.dart";
import "package:shopping_list_application/models/ingredient.dart";
import "package:shopping_list_application/models/recipe.dart";
import "package:shopping_list_application/services/firestore_storage.dart";

class RecipeController {
  factory RecipeController() => _singleton;

  RecipeController._internal();

  static final RecipeController _singleton = RecipeController._internal();

  static final _storage = FirestoreStorage();

  Stream<List<Recipe>> getStream() => _storage.getRecipes();

  Future<void> insertRecipe(List<Ingredient> ingredients, List<Recipe> recipes, int prepTimeInMinutes,
          int cookTimeInMinutes, String name) =>
      _storage.insertRecipe(
          ingredients, recipes ,prepTimeInMinutes, cookTimeInMinutes, name);

  Future<void> removeRecipe(Recipe recipe) => _storage.removeRecipe(recipe);
}
