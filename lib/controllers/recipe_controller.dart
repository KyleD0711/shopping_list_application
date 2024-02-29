import "package:shopping_list_application/models/ingredient.dart";
import "package:shopping_list_application/models/recipe.dart";
import "package:shopping_list_application/services/recipe_service.dart";

class RecipeController {
  factory RecipeController() => _singleton;

  RecipeController._internal();

  static final RecipeController _singleton = RecipeController._internal();

  static final _service = RecipeService();

  Stream<List<Recipe>> getStream() => _service.getRecipes();

  Future<void> insertRecipe(Map<Ingredient, String> ingredients, List<Recipe> recipes, int prepTimeInMinutes,
          int cookTimeInMinutes, String name) =>
      _service.insertRecipe(
          ingredients, recipes ,prepTimeInMinutes, cookTimeInMinutes, name);

  Future<void> removeRecipe(Recipe recipe) => _service.removeRecipe(recipe);
}
