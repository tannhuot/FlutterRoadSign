import 'package:flutter/material.dart';

import '../widgets/cts_scrollView.dart';
import '../widgets/cts_progress_widget.dart';
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

  final bool _isRequesting = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _confirmPasswordController.dispose();
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
          left: 15,
          right: 15,
        ),
        child: CTSScrollView.buildScrollView(
          ctx: context,
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
                isPasswordField: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CTSTextField(
                placeHolder: "Confirm your password",
                title: "Confirm Password",
                controller: _confirmPasswordController,
                isPasswordField: true,
              ),
              const SizedBox(
                height: 8,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CTSElevatedButton(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  title: "Sign Up",
                  onPress: () {
                    setState(() {
                      // _isRequesting = true;
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
}
