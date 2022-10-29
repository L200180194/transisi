import 'package:flutter/cupertino.dart';
import 'package:transisi/service/signup_service.dart';

class SignUpProvider with ChangeNotifier {
  Future<bool> signUp(
      {required String email,
      required String password,
      required String passverif}) async {
    if (await SignUpService()
        .signUp(email: email, password: password, passverif: passverif)) {
      return true;
    } else {
      return false;
    }
  }
}
