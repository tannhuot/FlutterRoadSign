import 'package:flutter/material.dart';

class CTSElevatedButton extends StatelessWidget {
  const CTSElevatedButton({
    Key? key,
    this.width,
    this.height,
    required this.title,
    this.fontsize,
    required this.onPress,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String title;
  final double? fontsize;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.white, width: 5),
      // ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(1, 11, 84, 1),
        ),
        onPressed: onPress,
        child: FittedBox(
          child: Text(
            title,
            style: TextStyle(
                fontSize: fontsize,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
