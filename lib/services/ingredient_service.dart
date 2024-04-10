import "package:cloud_firestore_odm/annotation.dart";
import "package:shopping_list_application/models/user.dart";
import "package:shopping_list_application/services/auth.dart";
import "package:shopping_list_application/services/user_service.dart";

class IngredientService {

  @Collection<Ingredient>('users/*/ingredients')
  final ingredientsRef = UserService.usersRef.doc(Auth().userId).ingredients;

  IngredientCollectionReference getIngredients() {
    return ingredientsRef;
  }

}
