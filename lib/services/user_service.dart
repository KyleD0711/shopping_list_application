import 'package:shopping_list_application/models/user.dart';
import 'package:cloud_firestore_odm/annotation.dart';

class UserService{

  @Collection<User>('users')
  static UserCollectionReference get usersRef => UserCollectionReference();

  factory UserService() => _singleton;

  UserService._internal();

  static final UserService _singleton = UserService._internal();
}