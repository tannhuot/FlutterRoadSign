import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/cts_app_bar_widget.dart';
import '../widgets/cts_elevated_button.dart';
import '../widgets/cts_scrollView.dart';
import '../widgets/cts_textfield.dart';
import '../helper/sharepreference.dart';
import '../models/profile_model.dart';
import '../http/http_request.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  XFile? image;

  @override
  void initState() {
    loadProfile();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CTSAppBarWidget(
        title: "Profile",
        isShowProfile: false,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext ctx) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: CTSScrollView.buildScrollView(
          ctx: context,
          child: Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: image == null
                            ? const CircleAvatar(
                                backgroundColor: Colors.red,
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(File(image!.path)),
                              ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    IconButton(
                        onPressed: () {
                          _takePicture();
                        },
                        icon: Image.asset("assets/images/info.png"))
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              CTSTextField(
                placeHolder: "Enter your First Name",
                title: "First Name",
                controller: _firstNameController,
              ),
              const SizedBox(
                height: 10,
              ),
              CTSTextField(
                placeHolder: "Enter your Last Name",
                title: "Last Name",
                controller: _lastNameController,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CTSElevatedButton(
                  width: MediaQuery.of(ctx).size.width - 30,
                  height: 50,
                  title: "Save",
                  fontsize: 20,
                  onPress: () {
                    HttpRequest.updateProfile(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            profilePhoto: image!)
                        .then((value) {
                      if (value.data != null) {
                        SharedPref.shared.save("profile", value);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Update success"),
                          ),
                        );
                      }
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  loadProfile() async {
    try {
      ProfileModel profileLoad =
          ProfileModel.fromJson(await SharedPref.shared.read("profile"));
      setState(() {
        _firstNameController.text = profileLoad.data?.firstName ?? "";
        _lastNameController.text = profileLoad.data?.lastName ?? "";
      });
    } catch (_) {}
  }

  Future _takePicture() async {
    final imageFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxWidth: 200, maxHeight: 200);

    if (imageFile == null) return;

    setState(() {
      image = imageFile;
    });
  }
}
