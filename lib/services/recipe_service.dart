import "package:cloud_firestore_odm/annotation.dart";
import "package:shopping_list_application/models/user.dart";
import "package:shopping_list_application/services/auth.dart";
import "package:shopping_list_application/services/user_service.dart";

class RecipeService {
  @Collection<Recipe>('users/*/recipes')
  RecipeCollectionReference recipes =
      UserService.usersRef.doc(Auth().userId).recipes;

  RecipeCollectionReference getRecipes() {
    return recipes;
  }

  RecipeDocumentReference getRecipe(String id) {
    return recipes.doc(id);
  }

  Future<Recipe?> getRecipeByName(String name) async {
    try {
      RecipeQuerySnapshot snapshot = await recipes
          .whereName(isEqualTo: name)
          .get()
          .catchError((error, stackTrace) => throw Exception(stackTrace));
      if (snapshot.docs.isEmpty) {
        return null;
      }

      return snapshot.docs.first.data;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}
