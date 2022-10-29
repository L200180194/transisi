import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:transisi/provider/signup_provider.dart';

import 'package:transisi/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transisi/widget/loading_button.dart';
import 'package:transisi/widget/password_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController passwordVerif = TextEditingController(text: '');
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    SignUpProvider sp = Provider.of<SignUpProvider>(context);
    handleSignUp() async {
      setState(() {
        _isLoading = true;
      });
      if (passwordController.text != passwordVerif.text) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Your password confirmation is different",
              style: primaryTS.copyWith(color: Colors.white),
            )));
      } else {
        if (await sp.signUp(
                email: emailController.text,
                password: passwordController.text,
                passverif: passwordVerif.text) &&
            passwordController.text == passwordVerif.text) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Success",
                style: primaryTS.copyWith(color: Colors.white),
              )));
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Gagal SignUp",
                style: primaryTS.copyWith(color: Colors.white),
              )));
        }
      }
      setState(() {
        _isLoading = false;
      });
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 5.h),
              child: Text(
                'Hi',
                style: primaryTS.copyWith(
                    fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 5.h),
              child: Text(
                'Hello, Create your acount',
                style: primaryTS.copyWith(fontSize: 16.sp, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 44.h,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 5.h),
              child: Text(
                'Email Address',
                style: primaryTS.copyWith(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 11.h),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Enter Your Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 5.h),
              child: Text(
                'Password',
                style: primaryTS.copyWith(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
            PasswordInputWidget(
              passCont: passwordController,
            ),
            SizedBox(
              height: 11.h,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 5.h),
              child: Text(
                'Password Confirmation',
                style: primaryTS.copyWith(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
            PasswordInputWidget(
              passCont: passwordVerif,
            ),
            SizedBox(
              height: 24.h,
            ),
            _isLoading
                ? const LoadingButton()
                : Container(
                    margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.h),
                    height: 40.h,
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        handleSignUp();
                      },
                      color: primaryColor,
                      child: Text(
                        'SignUp',
                        style: primaryTS.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: Colors.white),
                      ),
                    ),
                  ),
            Container(
              margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
              child: Row(
                children: [
                  Text(
                    'Already have an account? ',
                    style: primaryTS.copyWith(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      ' LogIn',
                      style: primaryTS.copyWith(color: primaryColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
