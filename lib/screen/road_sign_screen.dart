import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mit_final_project/http/http_request.dart';
import 'package:mit_final_project/models/traffic_sign_model.dart';
import 'package:mit_final_project/screen/road_sign_detail_screen.dart';

class RoadSignScreen extends StatefulWidget {
  const RoadSignScreen({Key? key}) : super(key: key);

  @override
  State<RoadSignScreen> createState() => _RoadSignScreenState();
}

class _RoadSignScreenState extends State<RoadSignScreen> {
  Future<TrafficSignModel>? InitData;
  Future<TrafficSignModel> initData() async {
    var res = await HttpRequest.getTrafficSign();
    return res;
  }

  @override
  void initState() {
    InitData = initData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<TrafficSignModel>(
        future: InitData,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
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
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => RoadSignDetailScreen(
                                    data: snapshot.data!.data![index],
                                  )),
                        );
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.network(
                                HttpRequest.mainUrl +
                                    snapshot.data!.data![index].image!,
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
          return Container();
        }),
      ),
    );
  }
}
