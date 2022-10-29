import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Future<bool> login({required email, required password}) async {
    var urlregist = Uri.parse('https://reqres.in/api/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    var response = await http.post(urlregist, headers: headers, body: body);

    if (response.statusCode == 200) {
      var token = jsonDecode(response.body);
      final sp = await SharedPreferences.getInstance();
      await sp.setString('token', token['token'].toString());

      return true;
    } else {
      return false;
    }
  }
}
