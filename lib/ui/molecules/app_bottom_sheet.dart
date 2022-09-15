import 'package:flutter/material.dart';
import 'package:synergy/utils/theme/color_scheme.dart';

class AppBottomSheet {
  AppBottomSheet._();

  static show(
    BuildContext context, {
    bool isScrollControlled= true,
    bool isDismissible= true,
    // bool enableDrag= true,
    Color backgroundColor = AppColor.white,
    double? height,
    bool showCloseButton = false,
    required Widget Function(BuildContext context) builder,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      // enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        child: Container(
          height: height,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              builder(context),
            ],
          ),
        ),
      ),
    );
  }
}
