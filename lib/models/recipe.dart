import "package:cloud_firestore/cloud_firestore.dart";
import "package:uuid/uuid.dart";
import "package:shopping_list_application/models/ingredient.dart";

class Recipe {
  Recipe({String? id, List<Map<String, String>>? ingredients, List<Map<String, String>>? recipes, int? prepTimeInMinutes,
      int? cookTimeInMinutes, String? name, String? description, String? instructions})
      : id = id ?? _uuid.v1(),
        ingredients = ingredients ?? List<Map<String, String>>.empty(growable: true),
        recipes = recipes ?? List<Map<String, String>>.empty(growable: true), 
        prepTimeInMinutes = prepTimeInMinutes ?? 0, 
        cookTimeInMinutes = cookTimeInMinutes ?? 0,
        description = description ?? "",
        instructions = instructions ?? "",
        name = name ?? "Unamed recipe";

  static const _uuid = Uuid();
  final String id;
  final List<Map<String, String>> ingredients;
  final List<Map<String, String>> recipes;
  final int prepTimeInMinutes;
  final int cookTimeInMinutes;
  final String description;
  final String instructions;
  final String name;

  @override
  String toString() {
    return name;
  }
}
