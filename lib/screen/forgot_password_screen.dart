import 'package:flutter/material.dart';
import 'package:mit_final_project/widgets/cts_progress_widget.dart';

import '../constants/style.dart';
import '../widgets/cts_elevated_button.dart';
import '../widgets/cts_textfield.dart';
import '../widgets/cts_app_bar_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  bool _isRequesting = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CTSAppBarWidget(
        title: "Forgot Password",
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
            const Spacer(),
            CTSElevatedButton(
              width: MediaQuery.of(context).size.width,
              height: 50,
              title: "Forgot Password",
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
