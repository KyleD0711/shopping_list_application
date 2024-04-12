import '../services/auth.dart';

class AuthController {
  factory AuthController() => _singleton;

  AuthController._internal();

  static final AuthController _singleton = AuthController._internal();
  final _auth = Auth();

  Future<String?> createAccount(
      {required String? email, required String? password}) {
        if (email == null){
          return Future.value("Email can't be null");
        }
        else if (password == null){
          return Future.value("Password can't be null");
        }
        else {
          return _auth.createAccountWithEmailAndPassword(
          email: email, password: password);
        }
        
  }

  Future<String?> signIn({required String email, required String password}) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<String?> signInWithGoogle(){
    return _auth.signInwithGoogle();
  }

  Future<void> signOutFromGoogle(){
    return _auth.signOutFromGoogle();
  }

  void signOut() => _auth.signOut();

  bool signedIn() => userId != null;

  String? get userId => _auth.userId;

  Stream<bool> get loggedInStream => _auth.stream.map((user) => user != null);
}
