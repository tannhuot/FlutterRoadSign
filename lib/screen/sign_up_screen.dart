import 'package:flutter/material.dart';
import 'package:mit_final_project/screen/forgot_password_screen.dart';
import 'package:mit_final_project/widgets/cts_progress_widget.dart';

import '../constants/style.dart';
import '../widgets/cts_elevated_button.dart';
import '../widgets/cts_textfield.dart';
import '../widgets/cts_app_bar_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenScreenState();
}

class _SignUpScreenScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isRequesting = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CTSAppBarWidget(
        title: "Sign Up",
        isShowProfile: false,
      ),
      body: CTSProgressWidget(
        isRequesting: _isRequesting,
        child: _buildBody,
      ),
    );
  }

  Widget get _buildBody {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CTSTextField(
              placeHolder: "Enter your first name",
              title: "First Name",
              controller: _firstNameController,
            ),
            const SizedBox(
              height: 15,
            ),
            CTSTextField(
              placeHolder: "Enter your last name",
              title: "Last Name",
              controller: _lastNameController,
            ),
            const SizedBox(
              height: 15,
            ),
            CTSTextField(
              placeHolder: "Enter your email",
              title: "Email",
              controller: _emailController,
            ),
            const SizedBox(
              height: 15,
            ),
            CTSTextField(
              placeHolder: "Enter your password",
              title: "Password",
              controller: _passwordController,
            ),
            const SizedBox(
              height: 15,
            ),
            CTSTextField(
              placeHolder: "Confirm your password",
              title: "Confirm Password",
              controller: _confirmPasswordController,
            ),
            const SizedBox(
              height: 8,
            ),
            const Spacer(),
            CTSElevatedButton(
              width: MediaQuery.of(context).size.width,
              height: 50,
              title: "Sign Up",
              onPress: () {
                setState(() {
                  // _isRequesting = true;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
