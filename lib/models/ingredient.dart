import "package:uuid/uuid.dart";

class Ingredient {
  Ingredient(this.name, String? id) : 
    id = id ?? _uuid.v1();
  static const _uuid = Uuid();
  final String id;
  final String name;
  // Add stdqty for other functionality here
}