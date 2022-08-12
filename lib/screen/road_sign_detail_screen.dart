import 'package:flutter/material.dart';
import 'package:mit_final_project/http/http_request.dart';
import 'package:mit_final_project/models/traffic_sign_model.dart';
import 'package:mit_final_project/widgets/cts_app_bar_widget.dart';

class RoadSignDetailScreen extends StatelessWidget {
  final Data data;
  const RoadSignDetailScreen({Key? key, required this.data}) : super(key: key);

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
                HttpRequest.mainUrl + data.image!,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 300,
              child: Text(
                data.nameKh!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            SizedBox(
              width: 300,
              child: Text(
                data.nameEn!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
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
