import 'package:flutter/material.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({Key? key, required this.width, required this.height, this.child,
    this.backgroundColor,}) : super(key: key);

  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SystemTheme.scale(width!),
      height: SystemTheme.scale(height!),
      decoration: BoxDecoration(
        shape: BoxShape.circle, color: backgroundColor ?? AppColor.enabledColor,),
      child: child
    );
  }
}
