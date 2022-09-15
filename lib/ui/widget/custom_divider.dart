import 'package:flutter/material.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key, this.width = 1, this. height = 15, this.color = AppColor.dividerColor,
    this.pLeft= 0,  this.pTop= 0,  this.pRight= 0,  this.pBottom= 0,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? color;
  final double pLeft;
  final double pTop;
  final double pRight;
  final double pBottom;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.fromLTRB(SystemTheme.scale(pLeft), SystemTheme.scale(pTop), SystemTheme.scale(pRight), SystemTheme.scale(pBottom)),
      width: SystemTheme.scale(width!),
      height: SystemTheme.scale(height!),
      color: color,
    );
  }
}
