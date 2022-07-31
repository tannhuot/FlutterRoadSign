import 'package:flutter/material.dart';
import 'package:mit_final_project/screen/home_screen.dart';

import '../constants/style.dart';
import '../screen/sign_in_screen.dart';
// import './screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.white,
        appBarTheme: const AppBarTheme(
            backgroundColor: Style.primaryColor,
            titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Style.secondaryColor,
            ),
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0),
      ),
      home: const SignInScreen(),
    );
  }
}
