import "package:cloud_firestore/cloud_firestore.dart";
import "package:uuid/uuid.dart";
import "package:shopping_list_application/models/ingredient.dart";

class Recipe {
  Recipe(String? id, List<Ingredient>? ingredients, List<Recipe>? recipes, this.prepTimeInMinutes,
      this.cookTimeInMinutes, this.name)
      : id = id ?? _uuid.v1(),
        ingredients = ingredients ?? List<Ingredient>.empty(),
        recipes = recipes ?? List<Recipe>.empty();

  static const _uuid = Uuid();
  final String id;
  final List<Ingredient> ingredients;
  final List<Recipe> recipes;
  final int prepTimeInMinutes;
  final int cookTimeInMinutes;
  final String name;
}
