import 'package:flutter/material.dart';
import 'package:mit_final_project/screen/home_screen.dart';

import '../constants/style.dart';
import '../screen/sign_in_screen.dart';
import '../models/profile_model.dart';
import '../helper/sharepreference.dart';
// import './screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
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
        home: FutureBuilder<ProfileModel?>(
            future: loadProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data?.data?.id != null) {
                  return const HomeScreen();
                }
                return const SignInScreen();
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  Future<ProfileModel?> loadProfile() async {
    try {
      ProfileModel profileLoad =
          ProfileModel.fromJson(await SharedPref.shared.read("profile"));
      return profileLoad;
    } catch (_) {
      return null;
    }
  }
}
