import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_list_application/models/ingredient.dart';
import 'package:shopping_list_application/models/recipe.dart';
import 'package:shopping_list_application/services/auth.dart';

class FirestoreStorage {
  static const _users = 'users';
  static const _recipes = 'recipes';
  static const _ingredients = 'ingredients';
  static const _prepTimeInMinutes = 'prepTimeInMinutes';
  static const _cookTimeInMinutes = 'cookTimeInMinutes';
  static const _name = 'name';
  static final _database = FirebaseFirestore.instance;

  Stream<List<Recipe>> getRecipes() {
    return _database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_recipes)
        .snapshots()
        .map((event) => event.docs
            .map((e) => Recipe(
                e.id,
                List<Ingredient>.from(e.data()[_ingredients]),
                List<Recipe>.from(e.data()[_recipes]),
                e.data()[_prepTimeInMinutes],
                e.data()[_cookTimeInMinutes],
                e.data()[_name]))
            .toList());
  }

  Future<void> insertRecipe(List<Ingredient> ingredients, List<Recipe> recipes, int prepTimeInMinutes,
      int cookTimeInMinutes, String name) {
    final data = {
      "ingredients": ingredients.toList(),
      "recipes": recipes.toList(),
      "prepTimeInMinutes": prepTimeInMinutes,
      "cookTimeInMinutes": cookTimeInMinutes,
      "name": name
    };
    return _database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_recipes)
        .add(data);
  }

  Future<void> removeRecipe(Recipe recipe) {
    return _database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_recipes)
        .doc(recipe.id)
        .delete();
  }

  Future<void> initialize() {
    return Future.value();
  }
}
