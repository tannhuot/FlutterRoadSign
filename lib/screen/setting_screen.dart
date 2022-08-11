import 'package:flutter/material.dart';
import 'package:mit_final_project/http/http_request.dart';
import 'package:mit_final_project/widgets/cts_app_bar_widget.dart';
import 'package:mit_final_project/widgets/cts_progress_widget.dart';

import '../helper/sharepreference.dart';
import '../models/profile_model.dart';
import '../widgets/cts_picker_button.dart';
import '../widgets/cts_elevated_button.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isLocationOn = false;
  bool isSoundOn = false;

  bool isRequesting = false;

  @override
  void initState() {
    loadProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CTSAppBarWidget(title: "Road Sign"),
      body: CTSProgressWidget(
        isRequesting: isRequesting,
        child: _buildBody,
      ),
    );
  }

  Widget get _buildBody {
    return Padding(
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
                  isLocationOn = item.toString() == "true";
                });
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: !isLocationOn,
                  child: Center(
                    child: Text(isLocationOn ? "Off" : "On"),
                  ),
                ),
              ],
              position: PopupMenuPosition.under,
              offset: const Offset(1, 0),
              child: CTSPickerButtonWidget(
                title: "Location",
                option: isLocationOn ? "On" : "Off",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PopupMenuButton(
              onSelected: (item) {
                setState(() {
                  isSoundOn = item.toString() == "true";
                });
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: !isSoundOn,
                  child: Center(
                    child: Text(isSoundOn ? "Off" : "On"),
                  ),
                ),
              ],
              position: PopupMenuPosition.under,
              offset: const Offset(1, 0),
              child: CTSPickerButtonWidget(
                title: "Sound",
                option: isSoundOn ? "On" : "Off",
              ),
            ),
            const Spacer(),
            CTSElevatedButton(
              width: MediaQuery.of(context).size.width - 30,
              height: 50,
              title: "Save",
              fontsize: 20,
              onPress: () {
                setState(() {
                  isRequesting = true;
                });
                HttpRequest.updateSetting(
                  languageId: 1,
                  isLocationOn: isLocationOn,
                  isSoundOn: isSoundOn,
                ).then((value) {
                  setState(() {
                    isRequesting = false;
                  });
                  if (value.data?.id != null) {
                    SharedPref.shared.save("profile", value);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Update success"),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Something went wrong!"),
                      ),
                    );
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }

  loadProfile() async {
    try {
      ProfileModel profileLoad =
          ProfileModel.fromJson(await SharedPref.shared.read("profile"));
      setState(() {
        isLocationOn = profileLoad.data?.isLocationOn ?? true;
        isSoundOn = profileLoad.data?.isSoundOn ?? true;
        isRequesting = false;
      });
    } catch (_) {}
  }
}
