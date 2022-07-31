import 'package:flutter/material.dart';

class CTSProgressWidget extends StatelessWidget {
  const CTSProgressWidget({
    Key? key,
    required this.child,
    required this.isRequesting,
  }) : super(key: key);

  final Widget child;
  final bool isRequesting;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (isRequesting) {
      final modal = Stack(
        children: const [
          Opacity(
            opacity: 0.3,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.grey,
            ),
          ),
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
