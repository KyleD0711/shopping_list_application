import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shopping_list_application/controllers/auth_controller.dart';
import 'package:shopping_list_application/pages/home_page.dart';
import 'package:shopping_list_application/utils/authentication_validators.dart';
import 'package:shopping_list_application/utils/form_validators.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _signupUser(SignupData data) {
    return AuthController().createAccount(email: data.name, password: data.password);
  }

  Future<String?> _authUser(LoginData data) async {
    return await AuthController().signIn(email: data.name, password: data.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome"),
          centerTitle: true,
        ),
        body: FlutterLogin(
          onLogin: (LoginData data) {
            return _authUser(data);
          },
          onSubmitAnimationCompleted: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
          onSignup: (signupData) {
            return _signupUser(signupData);
          },
          userValidator: (emailAddress) {
            return validateNonEmptyMessage(emailAddress) ??
                validateEmailAddress(emailAddress);
          },
          passwordValidator: (password) {
            return validateNonEmptyMessage(password);
          },
          hideForgotPasswordButton: true,
          onRecoverPassword: (String response) {
            debugPrint("I shouldn't be here");
          },
          loginAfterSignUp: false,
        ));
  }
}
