import 'package:flutter/material.dart';

import '../helper/sharepreference.dart';
import '../models/profile_model.dart';
import '../screen/profile_screen.dart';
import '../screen/setting_screen.dart';
import '../screen/sign_in_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  ProfileModel profile = ProfileModel();

  @override
  void initState() {
    loadProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(children: [
          SizedBox(
            width: 120,
            height: 120,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: profile.data?.profilePhoto != null
                  ? CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          NetworkImage(profile.data?.profilePhoto ?? ""),
                    )
                  : const CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            profile.data?.firstName ?? "N/A",
            style: const TextStyle(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _buildDrawerButton("history-32", "History", () {
                  //Go To History
                  Navigator.of(context).pop();
                }),
                const SizedBox(
                  height: 15,
                ),
                _buildDrawerButton("info", "About us", () {
                  //Go To About us
                  Navigator.of(context).pop();
                }),
                const SizedBox(
                  height: 15,
                ),
                _buildDrawerButton("setting-64", "Setting", () {
                  //Go To Setting
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingScreen(),
                    ),
                  );
                })
              ],
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: TextButton(
                onPressed: () {
                  SharedPref.shared.remove("profile");
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
                style: const ButtonStyle(alignment: Alignment.centerRight),
                child: const Text(
                  "Sign out",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildDrawerButton(String img, String title, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          SizedBox(
            width: 25,
            height: 25,
            child: Image.asset(
              "assets/images/$img.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  loadProfile() async {
    try {
      ProfileModel profileLoad =
          ProfileModel.fromJson(await SharedPref.shared.read("profile"));
      setState(() {
        profile = profileLoad;
      });
    } catch (_) {}
  }
}
