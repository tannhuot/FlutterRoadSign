import 'package:flutter/material.dart';
import 'package:mit_final_project/screen/profile_screen.dart';
import 'package:mit_final_project/screen/setting_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(242, 246, 82, 1),
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
              child: const CircleAvatar(
                backgroundColor: Colors.red,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Ty Ty",
            style: TextStyle(
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
                onPressed: () {},
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
}
