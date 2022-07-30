import 'package:flutter/material.dart';
import 'package:mit_final_project/screen/road_sign_screen.dart';
import 'package:mit_final_project/widgets/cts_app_bar_widget.dart';
import 'package:mit_final_project/widgets/cts_elevated_button.dart';

import '../widgets/drawer_widget.dart';
import '../widgets/cts_app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CTSAppBarWidget(title: ""),
      drawer: const DrawerWidget(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext ctx) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CTSElevatedButton(
            width: MediaQuery.of(ctx).size.width - 30,
            height: 160,
            title: "Road sign",
            fontsize: 30,
            onPress: () {
              Navigator.of(ctx).push(
                MaterialPageRoute(
                  builder: ((context) => const RoadSignScreen()),
                ),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          CTSElevatedButton(
            width: MediaQuery.of(ctx).size.width - 30,
            height: 160,
            title: "Traffic Signs detection",
            fontsize: 30,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
