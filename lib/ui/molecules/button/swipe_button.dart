import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class SwipeButton extends StatelessWidget {
  final String? text;
  final bool? isLoading;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final double? buttonBorderRadius;
  final Color? buttonBackGroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final GlobalKey? sliderKey;
  final Function? onSubmit;

  const SwipeButton(
      {Key? key,
        this.text,
        this.isLoading = false,
        this.textStyle,
        this.width,
        this.height,
        this.buttonBorderRadius,
        this.buttonBackGroundColor,
        this.textColor,
        this.fontSize,
        this.fontWeight,
        this.textAlign,
        this.letterSpacing,
        this.sliderKey,
        required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      key: sliderKey,
      borderRadius: SystemTheme.scale(buttonBorderRadius ?? 12),
      outerColor: buttonBackGroundColor ?? AppColor.enabledColor,
      sliderRotate: false,
      onSubmit: () {
        onSubmit?.call();
      },
      child: AppText(title: '$text',
        textColor: textColor,
        fontSize: fontSize ?? 15,
        fontWeight: fontWeight,
        textAlign: textAlign ?? TextAlign.center,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
