import 'package:flutter/material.dart';
import 'package:transisi/model/employee.dart';
import 'package:transisi/service/employee_service.dart';

class EmployeeProvider with ChangeNotifier {
  List<Employee> _emp = [];

  List<Employee> get employee => _emp;
  set employee(List<Employee> employee) {
    _emp = employee;
    notifyListeners();
  }

  Future<void> getEmployee() async {
    try {
      List<Employee> employ = await EmployeeService().getEmployees();
      _emp = employ;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> addEmployeeprovider(
      {required String email,
      required String fn,
      required ln,
      required String avatar}) async {
    try {
      Map<String, dynamic> data = await EmployeeService()
          .addEmployee(email: email, fn: fn, ln: ln, avatar: avatar);

      _emp.add(Employee(
          id: int.parse(data['id']),
          email: data['email'],
          first_name: data['first_name'],
          avatar: data['avatar'],
          last_name: data['last_name']));

      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
