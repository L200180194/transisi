import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transisi/page/add_page.dart';
import 'package:transisi/provider/employee_provider.dart';
import 'package:transisi/theme.dart';
import 'package:transisi/widget/list_employee_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getEmployee();
    super.initState();
  }

  logout() async {
    final sp = await SharedPreferences.getInstance();
    sp.remove('token');
  }

  bool isLoading = true;
  getEmployee() async {
    await Provider.of<EmployeeProvider>(context, listen: false).getEmployee();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    EmployeeProvider ep = Provider.of<EmployeeProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Center(child: Text('Home')),
        leading: const SizedBox(),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 15.w),
              child: SizedBox(
                child: IconButton(
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () {
                    logout();
                    Navigator.popAndPushNamed(context, '/login');
                  },
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPage()));
        },
        tooltip: 'Add Employees',
        child: const Icon(Icons.add),
      ),
      body: isLoading
          ? SizedBox(
              child: SpinKitRing(color: primaryColor),
            )
          : ListView(
              children:
                  ep.employee.map((e) => ListEmployeeWidget(em: e)).toList(),
            ),
    );
  }
}
