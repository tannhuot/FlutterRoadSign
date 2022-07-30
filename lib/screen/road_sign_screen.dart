import 'package:flutter/material.dart';
import 'package:mit_final_project/widgets/cts_app_bar_widget.dart';

import '../screen/road_sign_detail_screen.dart';

class RoadSignScreen extends StatelessWidget {
  const RoadSignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CTSAppBarWidget(title: "Road Sign"),
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
      ),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: 50,
          itemBuilder: (context, idx) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const RoadSignDetailScreen()),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.network(
                        "https://picsum.photos/200",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 3,
                    color: Colors.black,
                  )
                ],
              ),
            );
          }),
    );
  }
}
