import "package:shopping_list_application/models/ingredient.dart";
import "package:shopping_list_application/services/ingredient_service.dart";

class IngredientController{
  factory IngredientController() => _singleton;

  IngredientController._internal();

  static final IngredientController _singleton = IngredientController._internal();

  static final _service = IngredientService();

  Stream<List<Ingredient>> getStream() => _service.getIngredientsStream();

  Future<List<Ingredient>> getIngredients() => _service.getIngredients();

  Future<void> addIngredient(String name) =>
      _service.insertIngredient(name);

  Future<void> removeIngredient(Ingredient ingredient) => _service.removeIngredient(ingredient);
}
