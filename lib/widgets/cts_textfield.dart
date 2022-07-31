import 'package:flutter/material.dart';

class CTSTextField extends StatelessWidget {
  const CTSTextField({
    Key? key,
    required this.placeHolder,
    required this.title,
    required this.controller,
    this.isPasswordField = false,
  }) : super(key: key);

  final String placeHolder;
  final String title;
  final TextEditingController controller;
  final bool isPasswordField;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeHolder,
        hintStyle: const TextStyle(color: Colors.grey),
        labelText: title,
        labelStyle: const TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 3),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 3),
        ),
      ),
      autocorrect: false,
      enableSuggestions: false,
      obscureText: isPasswordField,
    );
  }
}
