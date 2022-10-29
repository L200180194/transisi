import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:transisi/theme.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  late String tkn;
  Future<String> getSession() async {
    final sp = await SharedPreferences.getInstance();
    String token = sp.getString('token') ?? '';
    setState(() {
      tkn = token;
    });
    return token;
  }

  getInit() async {
    getSession().then((value) {
      if (value != '') {
        Timer(const Duration(seconds: 1),
            () => Navigator.popAndPushNamed(context, '/home'));
      } else if (value == '') {
        Timer(const Duration(seconds: 1),
            () => Navigator.popAndPushNamed(context, '/login'));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
    );
  }
}
