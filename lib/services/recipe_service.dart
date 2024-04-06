import "package:cloud_firestore_odm/annotation.dart";
import "package:shopping_list_application/models/user.dart";
import "package:shopping_list_application/services/auth.dart";
import "package:shopping_list_application/services/user_service.dart";
import "./firestore_storage.dart";

class RecipeService {
  static const _users = 'users';
  static const _recipes = 'recipes';
  static const _ingredients = 'ingredients';
  static const _prepTime = 'prepTime';
  static const _cookTime = 'cookTime';
  static const _name = 'name';
  static const _description = 'description';
  static const _instructions = 'instructions';

  @Collection<Recipe>('users/*/recipes')
  RecipeCollectionReference recipes = UserService.usersRef.doc(Auth().userId).recipes;

  RecipeCollectionReference getRecipes() {
    return recipes;
  }

  RecipeDocumentReference getRecipe(String id){
    return recipes.doc(id);
  }

  // Stream<List<Recipe>> getRecipes() {
  //   return FirestoreStorage.database
  //       .collection(_users)
  //       .doc(Auth().userId)
  //       .collection(_recipes)
  //       .snapshots()
  //       .map((event) => event.docs.map((e) {
  //             List ingredients = e.data()[_ingredients];
  //             List recipes = e.data()[_recipes];
  //             return Recipe(
  //                 id: e.id,
  //                 ingredients: List<Map<String, String>>.from(ingredients.map((e) => Map<String, String>.from(e))),
  //                 recipes: List<Map<String, String>>.from(recipes.map((e) => Map<String, String>.from(e))),
  //                 prepTime: e.data()[_prepTime],
  //                 cookTime: e.data()[_cookTime],
  //                 name: e.data()[_name],
  //                 description: e.data()[_description],
  //                 instructions: e.data()[_instructions]);
  //           }).toList());
  // }

  Future<void> insertRecipe(
      List<Map<String, String>> ingredients,
      List<Map<String, String>> recipes,
      String prepTime,
      String cookTime,
      String name, String instructions, String description) {
    final data = {
      "ingredients": ingredients,
      "recipes": recipes,
      "prepTime": prepTime,
      "cookTime": cookTime,
      "name": name,
      "instructions": instructions,
      "description": description,
    };

    return FirestoreStorage.database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_recipes)
        .add(data);
  }

  Future<void> updateRecipe(
    String recipeId,
    List<Map<String, String>> ingredients,
    List<Map<String, String>> recipes,
    String prepTime,
    String cookTime,
    String name,
    String instructions,
    String description,
  ) {
  final data = {
    "ingredients": ingredients,
    "recipes": recipes,
    "prepTime": prepTime,
    "cookTime": cookTime,
    "name": name,
    "instructions": instructions,
    "description": description,
  };

  return FirestoreStorage.database
      .collection(_users)
      .doc(Auth().userId)
      .collection(_recipes)
      .doc(recipeId) // Update the document with the specified recipeId
      .update(data); // Update the document with the new data
}

  // Future<Recipe?> getRecipe(String recipeId) async {
    
  //   final recipeData = await FirestoreStorage.database.collection(_users).doc(Auth().userId).collection(_recipes).doc(recipeId).get();
  //   if (recipeData.data() == null){
  //     return null;
  //   }
  //   else {
  //     List ingredients = recipeData.data()![_ingredients];
  //             List recipes = recipeData.data()![_recipes];
  //     return Recipe(id: recipeData.id,
  //                 ingredients: List<Map<String, String>>.from(ingredients.map((e) => Map<String, String>.from(e))),
  //                 recipes: List<Map<String, String>>.from(recipes.map((e) => Map<String, String>.from(e))),
  //                 prepTime: recipeData.data()![_prepTime],
  //                 cookTime: recipeData.data()![_cookTime],
  //                 name: recipeData.data()![_name],
  //                 description: recipeData.data()![_description],
  //                 instructions: recipeData.data()![_instructions]);
  //   }
    
  // }

  Future<void> removeRecipe(Recipe recipe) {
    return FirestoreStorage.database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_recipes)
        .doc(recipe.id)
        .delete();
  }
}
