import "package:shopping_list_application/models/ingredient.dart";
import "package:shopping_list_application/models/recipe.dart";
import "package:shopping_list_application/services/recipe_service.dart";

class RecipeController {
  factory RecipeController() => _singleton;

  RecipeController._internal();

  static final RecipeController _singleton = RecipeController._internal();

  static final _service = RecipeService();

  Stream<List<Recipe>> getStream() {
    return _service.getRecipes();
  }

  Future<void> insertRecipe(
          List<Map<String, String>> ingredients,
          List<Map<String, String>> recipes,
          String prepTime,
          String cookTime,
          String name,
          String instructions,
          String description) =>
      _service.insertRecipe(ingredients, recipes, prepTime, cookTime, name,
          instructions, description);

  Future<void> updateRecipe(
    String recipeId,
    List<Map<String, String>> ingredients,
    List<Map<String, String>> recipes,
    String prepTime,
    String cookTime,
    String name,
    String instructions,
    String description,
  ) =>
      _service.updateRecipe(
        recipeId,
        ingredients,
        recipes,
        prepTime,
        cookTime,
        name,
        instructions,
        description,
      );

  Future<void> removeRecipe(Recipe recipe) => _service.removeRecipe(recipe);

  Future<Recipe?> getRecipe(String recipeId) => _service.getRecipe(recipeId);
}
