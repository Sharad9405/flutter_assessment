import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/ui_utils.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class AppButton extends StatelessWidget {
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
  final String? font;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final Function? onButtonTap;

   const AppButton(
      {Key? key,
        this.text,
        this.isLoading = false,
        this.textStyle,
        this.width,
        this.height,
        this.buttonBorderRadius,
        this.buttonBackGroundColor,
        this.textColor= AppColor.white,
        this.fontSize,
        this.fontWeight,
        this.font,
        this.textAlign,
        this.letterSpacing,
        this.onButtonTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SystemTheme.scale(height ?? 52),
      width: SystemTheme.scale(width ?? UIUtils.width(context)),
      child: ElevatedButton(
        onPressed: () => onButtonTap?.call(),
        style: ButtonStyle(
            foregroundColor:
            MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(buttonBackGroundColor ?? AppColor.enabledColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonBorderRadius ?? 14),
                    side: BorderSide(color: buttonBackGroundColor ?? AppColor.enabledColor)))),
            child: Center(
              child: AppText(title: '$text',
                textColor: textColor,
                fontSize: fontSize ?? 15,
                fontWeight: fontWeight,
                font: font ?? FontEnum.GRegular.toString(),
                textAlign: textAlign ?? TextAlign.center,
                letterSpacing: letterSpacing,


              ),
            ),
      ),
    );
  }
}
