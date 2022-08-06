import 'package:flutter/material.dart';

class CTSScrollView {
  static buildScrollView({required BuildContext ctx, required Widget child}) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(ctx).size.height -
            const Size.fromHeight(kToolbarHeight).height -
            MediaQuery.of(ctx).viewPadding.top -
            MediaQuery.of(ctx).viewPadding.bottom,
        child: child,
      ),
    );
  }
}
