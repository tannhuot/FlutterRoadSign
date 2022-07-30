import 'package:flutter/material.dart';

import '../screen/profile_screen.dart';

class CTSAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const CTSAppBarWidget({
    Key? key,
    required this.title,
    this.isShowProfile = true,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
  }) : super(key: key);

  final String title;
  final bool isShowProfile;

  @override
  final Size preferredSize;

  @override
  State<CTSAppBarWidget> createState() => _CTSAppBarWidgetState();
}

class _CTSAppBarWidgetState extends State<CTSAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(actions: [
      widget.isShowProfile
          ? IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              icon: Image.asset(
                "assets/images/male-user-32.png",
                color: Colors.white,
              ),
            )
          : Container(),
    ]);
  }
}
