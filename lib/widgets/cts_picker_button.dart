import 'package:flutter/material.dart';

class CTSPickerButtonWidget extends StatelessWidget {
  const CTSPickerButtonWidget({
    Key? key,
    required this.title,
    this.option,
    this.optionImg,
  }) : super(key: key);

  final String title;
  final String? option;
  final String? optionImg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 3),
          ),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            option != null
                ? Text(
                    option!,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Image.asset("assets/images/$optionImg.png"),
            const SizedBox(
              width: 5,
            ),
            Image.asset("assets/images/history-32.png"),
          ],
        ),
      ),
    );
  }
}
