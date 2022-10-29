import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:transisi/model/employee.dart';

class EmployeeService {
  Future<List<Employee>> getEmployees() async {
    var urlEmployee = Uri.parse('https://reqres.in/api/users');
    var response = await http.get(urlEmployee);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      List<Employee> em = [];
      for (var item in data) {
        em.add(Employee.fromJson(item));
      }

      return em;
    } else {
      throw Exception('Gagal ');
    }
  }

  Future<Map<String, dynamic>> addEmployee(
      {required String email,
      required String fn,
      required ln,
      required String avatar}) async {
    var urladd = Uri.parse('https://reqres.in/api/users');
    var body = jsonEncode(
        {'email': email, 'first_name': fn, 'last_name': ln, 'avatar': avatar});
    var request = await http.post(urladd,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: body);
    // print(request.body);

    if (request.statusCode == 201) {
      var data = jsonDecode(request.body);

      Map<String, dynamic> em = {
        'id': data['id'],
        'first_name': data['first_name'],
        'email': data['email'],
        'last_name': data['last_name'],
        'avatar': data['avatar']
      };

      return em;
    } else {
      throw Exception('Gagal ');
    }
  }
}
