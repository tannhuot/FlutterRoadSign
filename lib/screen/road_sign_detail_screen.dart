import 'package:flutter/material.dart';
import 'package:mit_final_project/widgets/cts_app_bar_widget.dart';

class RoadSignDetailScreen extends StatelessWidget {
  const RoadSignDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CTSAppBarWidget(title: ""),
      body: Container(
        padding: const EdgeInsets.only(top: 35),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Image.network(
                "https://picsum.photos/200",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              width: 300,
              child: Text(
                "Beware of road hump ahead.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
