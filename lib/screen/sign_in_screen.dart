import 'package:flutter/material.dart';
import 'package:mit_final_project/widgets/cts_scrollView.dart';

import '../helper/sharepreference.dart';
import '../http/http_request.dart';
import '../screen/forgot_password_screen.dart';
import '../screen/home_screen.dart';
import '../screen/sign_up_screen.dart';
import '../widgets/cts_progress_widget.dart';
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
          left: 15,
          right: 15,
        ),
        child: CTSScrollView.buildScrollView(
          ctx: context,
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
                isPasswordField: true,
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
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CTSElevatedButton(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  title: "Sign In",
                  onPress: () {
                    setState(() {
                      _isRequesting = true;
                    });

                    HttpRequest.signIn(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .then(
                      (value) {
                        setState(() {
                          _isRequesting = false;
                        });

                        if (value.access != null && value.access!.isNotEmpty) {
                          SharedPref.shared.save("token", value);

                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("NEED USER ID"),
                              content:
                                  const Text("Need user id to get user detail"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => _getProfile(),
                                  child: const Text("Dismiss"),
                                ),
                              ],
                            ),
                          );

                          // _getProfile();
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Login Error"),
                              content:
                                  const Text("check your email or password!"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text("Dismiss"),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getProfile() {
    // NEED USER ID
    HttpRequest.getProfile("2").then((value) {
      if (value.data != null) {
        SharedPref.shared.save("profile", value);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }
}
