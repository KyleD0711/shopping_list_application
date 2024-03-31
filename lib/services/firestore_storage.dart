import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreStorage {
  static FirebaseFirestore get database => FirebaseFirestore.instance;
  
  Future<void> initialize() {
    return Future.value();
  }
}
