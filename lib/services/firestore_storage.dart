import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_list_application/models/ingredient.dart';
import 'package:shopping_list_application/models/recipe.dart';
import 'package:shopping_list_application/services/auth.dart';

class FirestoreStorage {
  static FirebaseFirestore get database => FirebaseFirestore.instance;
  
  Future<void> initialize() {
    return Future.value();
  }
}
