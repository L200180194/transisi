import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:transisi/page/signup_page.dart';
import 'package:transisi/provider/login_provider.dart';

import 'package:transisi/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transisi/widget/loading_button.dart';
import 'package:transisi/widget/password_widget.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    LoginProvider lp = Provider.of<LoginProvider>(context);
    handlelogIn() async {
      setState(() {
        _isLoading = true;
      });
      if (await lp.login(
          email: emailController.text, password: passwordController.text)) {
        Navigator.popAndPushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Gagal Login",
              style: primaryTS.copyWith(color: Colors.white),
            )));
      }
      setState(() {
        _isLoading = false;
      });
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 5.h),
              child: Text(
                'Hi, Welcome Back !',
                style: primaryTS.copyWith(
                    fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 5.h),
              child: Text(
                'Hello again, log in to go back',
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
                        handlelogIn();
                      },
                      color: primaryColor,
                      child: Text(
                        'Login',
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
                    'Don’t have an account? ',
                    style: primaryTS.copyWith(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: Text(
                      ' Sign Up',
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
