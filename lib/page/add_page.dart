import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:transisi/provider/employee_provider.dart';
import 'package:transisi/theme.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController fn = TextEditingController(text: '');
  TextEditingController ln = TextEditingController(text: '');
  TextEditingController email = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    EmployeeProvider ep = Provider.of<EmployeeProvider>(context);
    handleAddEmployee() async {
      if (fn.text == '' || ln.text == '' || email.text == '') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Empty Fields",
              style: primaryTS.copyWith(color: Colors.white),
            )));
      } else {
        setState(() {
          isLoading = true;
        });
        if (await ep.addEmployeeprovider(
            email: email.text,
            fn: fn.text,
            ln: ln.text,
            avatar: 'https://reqres.in/img/faces/2-image.jpg')) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Success",
                style: primaryTS.copyWith(color: Colors.white),
              )));
        }
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Center(
            child: Text(
          'Add Employee',
          style: primaryTS,
        )),
        actions: [
          FlatButton(
              onPressed: () {
                handleAddEmployee();
              },
              child: Text(
                'Save',
                style: primaryTS.copyWith(color: Colors.white, fontSize: 16.sp),
              ))
        ],
      ),
      body: isLoading
          ? SizedBox(
              child: SpinKitRing(color: primaryColor),
            )
          : ListView(
              children: [
                Container(
                  height: 150.h,
                  child: Center(
                    child: Container(
                      height: 100.h,
                      width: 100.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://reqres.in/img/faces/2-image.jpg'),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                          color: Colors.green),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 5.h),
                  child: Text(
                    'First Name',
                    style: primaryTS.copyWith(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 11.h),
                  child: TextField(
                    controller: fn,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        hintText: 'Enter Employee First Name',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 5.h),
                  child: Text(
                    'Last Name',
                    style: primaryTS.copyWith(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 11.h),
                  child: TextField(
                    controller: ln,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        hintText: 'Enter Employee Last Name',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 5.h),
                  child: Text(
                    'Email',
                    style: primaryTS.copyWith(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 11.h),
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: 'Enter Employee Name',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
              ],
            ),
    );
  }
}
