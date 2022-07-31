import 'package:flutter/material.dart';
import 'package:mit_final_project/screen/forgot_password_screen.dart';
import 'package:mit_final_project/screen/home_screen.dart';
import 'package:mit_final_project/screen/sign_up_screen.dart';
import 'package:mit_final_project/widgets/cts_progress_widget.dart';

import '../constants/style.dart';
import '../widgets/cts_elevated_button.dart';
import '../widgets/cts_textfield.dart';
import '../widgets/cts_app_bar_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
        title: "Sign In",
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
              height: 8,
            ),
            TextButton(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Style.primaryColor,
                      width: 1,
                    ),
                  ),
                ),
                child: const Text(
                  "Create new account",
                  style: TextStyle(
                      fontSize: 20,
                      color: Style.primaryColor,
                      fontWeight: FontWeight.w700),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
            ),
            TextButton(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Style.primaryColor,
                      width: 1,
                    ),
                  ),
                ),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(
                      fontSize: 20,
                      color: Style.primaryColor,
                      fontWeight: FontWeight.w700),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen(),
                  ),
                );
              },
            ),
            const Spacer(),
            CTSElevatedButton(
              width: MediaQuery.of(context).size.width,
              height: 50,
              title: "Sign In",
              onPress: () {
                setState(() {
                  // _isRequesting = true;
                });

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
