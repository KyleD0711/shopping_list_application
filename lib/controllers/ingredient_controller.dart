import "package:cloud_firestore/cloud_firestore.dart";
import "package:shopping_list_application/models/ingredient.dart";
import "package:shopping_list_application/services/firestore_storage.dart";
import "package:shopping_list_application/services/ingredient_service.dart";

class IngredientController{
  factory IngredientController() => _singleton;

  IngredientController._internal();

  static final IngredientController _singleton = IngredientController._internal();

  static final _service = IngredientService();

  Stream<List<Ingredient>> getStream() => _service.getIngredients();

  Future<void> insertRecipe(String name) =>
      _service.insertIngredient(name);

  Future<void> removeRecipe(Ingredient ingredient) => _service.removeIngredient(ingredient);
}
