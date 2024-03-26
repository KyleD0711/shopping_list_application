import "package:shopping_list_application/models/ingredient.dart";
import "package:shopping_list_application/models/recipe.dart";
import "package:shopping_list_application/services/recipe_service.dart";

class RecipeController{
  factory RecipeController() => _singleton;

  RecipeController._internal();

  static final RecipeController _singleton = RecipeController._internal();

  static final _service = RecipeService();

  Stream<List<Recipe>> getStream() {
    return _service.getRecipes();
    }

  Future<void> insertRecipe(List<Map<String, String>> ingredients, List<Map<String, String>> recipes, int prepTimeInMinutes,
          int cookTimeInMinutes, String name) =>
      _service.insertRecipe(
          ingredients, recipes ,prepTimeInMinutes, cookTimeInMinutes, name);

  Future<void> removeRecipe(Recipe recipe) => _service.removeRecipe(recipe);
}
