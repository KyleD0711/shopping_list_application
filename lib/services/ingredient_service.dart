import "package:cloud_firestore_odm/annotation.dart";
import "package:shopping_list_application/models/user.dart";
import "package:shopping_list_application/services/auth.dart";
import "package:shopping_list_application/services/user_service.dart";
import "./firestore_storage.dart";

class IngredientService {
  static const _users = 'users';
  static const _ingredients = 'ingredients';

  @Collection<Ingredient>('users/*/ingredients')
  final ingredientsRef = UserService.usersRef.doc(Auth().userId).ingredients;

  IngredientCollectionReference getIngredients() {
    return ingredientsRef;
  }

  Stream<List<Ingredient>> getIngredientsStream() {
    return FirestoreStorage.database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_ingredients)
        .snapshots().map((event) =>
          event.docs.map((e) {
            Ingredient newIngredient = Ingredient(name: e.data()['name'], id: e.id);
            return newIngredient;
          }).toList()
         );
  }

  Future<void> insertIngredient(String name) {
    final data = {"name": name};
    print(data);
    return FirestoreStorage.database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_ingredients)
        .add(data);
  }

  Future<void> removeIngredient(Ingredient ingredient) {
    return FirestoreStorage.database
        .collection(_users)
        .doc(Auth().userId)
        .collection(_ingredients)
        .doc(ingredient.id)
        .delete();
  }

  // Future<List<Ingredient>> getIngredients() async {
  //   final ingredientsDoc = await FirestoreStorage.database
  //       .collection(_users)
  //       .doc(Auth().userId)
  //       .collection(_ingredients)
  //       .get();

  //   return ingredientsDoc.docs.map((e) => Ingredient(e.data()[_name], e.id)).toList();
  // }
}
