import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpService {
  Future<bool> signUp(
      {required email, required password, required passverif}) async {
    var urlregist = Uri.parse('https://reqres.in/api/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
      'password_verif': passverif,
    });
    var response = await http.post(urlregist, headers: headers, body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
