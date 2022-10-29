import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:transisi/page/home_page.dart';
import 'package:transisi/page/login_page.dart';
import 'package:transisi/page/splash.dart';
import 'package:transisi/provider/employee_provider.dart';
import 'package:transisi/provider/login_provider.dart';
import 'package:transisi/provider/signup_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
        ChangeNotifierProvider(create: (context) => EmployeeProvider())
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 640),
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              title: 'Flutter Demo',
              routes: {
                '/home': (ctx) => const HomePage(),
                '/login': (ctx) => const LogInPage()
              },
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
              ),
              // home: AddPage(),
              home: const Splash(),
            );
          }),
    );
  }
}
