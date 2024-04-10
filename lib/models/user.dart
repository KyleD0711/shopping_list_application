import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:shopping_list_application/models/quantity.dart';
import "package:uuid/uuid.dart";


// This doesn't exist yet...! See "Next Steps"
part 'user.g.dart';

/// A custom JsonSerializable annotation that supports decoding objects such
/// as Timestamps and DateTimes.
/// This variable can be reused between different models
const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  // The following values could alternatively be set inside your `build.yaml`
  explicitToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
);

@firestoreSerializable
class User {
  User({
    String? id,
  }) : id = id ?? _uuid.v1();

  static const _uuid = Uuid();

  @Id()
  final String id;
}

@firestoreSerializable
class Ingredient {
  Ingredient({required this.name, String? id}) : id = id ?? _uuid.v1();

  static const _uuid = Uuid();
  
  @Id()
  final String id;
  final String name;


  @override
  String toString() {
    return name;
  }
}

@firestoreSerializable
class Recipe {
  Recipe({String? id, List<Map<String, String>>? ingredients, List<Map<String, String>>? recipes,
     required this.prepTime, required this.cookTime, required this.description, required this.instructions, required this.name})
      : id = id ?? _uuid.v1(),
        ingredients = ingredients ?? List<Map<String, String>>.empty(growable: true),
        recipes = recipes ?? List<Map<String, String>>.empty(growable: true);

  static const _uuid = Uuid();

  @Id()
  final String id;
  
  final List<Map<String, String>> ingredients;
  final List<Map<String, String>> recipes;
  final String prepTime;
  final String cookTime;
  final String description;
  final String instructions;
  final String name;

  @override
  String toString() {
    return name;
  }
}

@firestoreSerializable
class Week {
  Week(
      {String? id,
      required this.beginDate,
      required this.endDate,
      required this.days})
      : id = id ?? _uuid.v1();


  static const _uuid = Uuid();

  @Id()
  final String id;
  
  final DateTime beginDate;
  final DateTime endDate;
  final Map<DateTime, List<Map<String, String>>> days;
}

@firestoreSerializable
class ShoppingList {
  ShoppingList({String? id, required this.name}) : id = id ?? _uuid.v1();

  static const _uuid = Uuid();

  @Id()
  final String id;
  final String name;
}

@firestoreSerializable
class ShoppingListItem {
  ShoppingListItem({String? id, bool? isSelected, required this.item, this.quantity}) : id = id ?? _uuid.v1(), isSelected = isSelected ?? false;

  static const _uuid = Uuid();

  @Id()
  final String id;
  final String item;
  String? quantity;
  bool isSelected;
}


@Collection<User>('users')
@Collection<Ingredient>('users/*/ingredients')
@Collection<Recipe>('users/*/recipes')
@Collection<Week>('users/*/weeks')
@Collection<ShoppingList>('users/*/shoppinglists')
@Collection<ShoppingListItem>('users/*/shoppinglists/*/shoppinglistitems')
final usersRef = UserCollectionReference();