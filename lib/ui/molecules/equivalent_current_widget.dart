import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class CurrencyWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  const CurrencyWidget({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageUtil.assetSvg(assetName: imagePath, width: SystemTheme.scale(20), height: SystemTheme.scale(20), fit: BoxFit.cover),

        AppText(
          title: text,
          fontSize: 11,
          font: FontEnum.GBold.toString(),
          textColor: AppColor.subColor,
        )
      ],
    );
  }
}