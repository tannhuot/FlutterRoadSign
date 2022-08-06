import 'package:flutter/material.dart';
import 'package:mit_final_project/http/http_request.dart';
import 'package:mit_final_project/widgets/cts_app_bar_widget.dart';

import '../widgets/cts_picker_button.dart';
import '../widgets/cts_elevated_button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String testLocation = "On";
  String testSound = "On";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CTSAppBarWidget(title: "Road Sign"),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: SafeArea(
          child: Column(
            children: [
              PopupMenuButton(
                onSelected: (item) {},
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/en-flag.png",
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "English",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
                position: PopupMenuPosition.under,
                offset: const Offset(1, 0),
                child: const CTSPickerButtonWidget(
                  title: "Language",
                  optionImg: "en-flag",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              PopupMenuButton(
                onSelected: (item) {
                  setState(() {
                    testLocation = item.toString();
                  });
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: testLocation == "On" ? "Off" : "On",
                    child: Center(
                      child: Text(testLocation == "On" ? "Off" : "On"),
                    ),
                  ),
                ],
                position: PopupMenuPosition.under,
                offset: const Offset(1, 0),
                child: CTSPickerButtonWidget(
                  title: "Location",
                  option: testLocation,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              PopupMenuButton(
                onSelected: (item) {
                  setState(() {
                    testSound = item.toString();
                  });
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: testSound == "On" ? "Off" : "On",
                    child: Center(
                      child: Text(testSound == "On" ? "Off" : "On"),
                    ),
                  ),
                ],
                position: PopupMenuPosition.under,
                offset: const Offset(1, 0),
                child: CTSPickerButtonWidget(
                  title: "Sound",
                  option: testSound,
                ),
              ),
              const Spacer(),
              CTSElevatedButton(
                width: MediaQuery.of(context).size.width - 30,
                height: 50,
                title: "Save",
                fontsize: 20,
                onPress: () {
                  HttpRequest.updateSetting(
                      id: 3,
                      languageId: 1,
                      isLocationOn: true,
                      isSoundOn: true);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
