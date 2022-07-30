import 'package:flutter/material.dart';
import 'package:mit_final_project/widgets/cts_app_bar_widget.dart';
import 'package:mit_final_project/widgets/cts_elevated_button.dart';
import 'package:mit_final_project/widgets/cts_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

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
          top: 20,
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 30),
                  IconButton(
                      onPressed: () {},
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
            CTSElevatedButton(
              width: MediaQuery.of(ctx).size.width - 30,
              height: 50,
              title: "Save",
              fontsize: 20,
              onPress: () {
                print(_firstNameController.text);
                print(_lastNameController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
