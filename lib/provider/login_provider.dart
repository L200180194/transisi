import 'package:flutter/cupertino.dart';
import 'package:transisi/service/login_service.dart';

class LoginProvider with ChangeNotifier {
  Future<bool> login({required String email, required String password}) async {
    if (await LoginService().login(email: email, password: password)) {
      return true;
    } else {
      return false;
    }
  }
}
