import 'package:flutter/material.dart';

import './screen/home_screen.dart';

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
            backgroundColor: Color.fromRGBO(1, 11, 84, 1),
            titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0),
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
