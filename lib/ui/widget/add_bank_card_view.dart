import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class AddBankCardView extends StatelessWidget {
  const AddBankCardView({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageUtil.assetSvg(assetName: AssetUtils.iconAddFilled, width: SystemTheme.scale(40),
            height: SystemTheme.scale(40),fit: BoxFit.cover,),

          AppText(
            title: label,
            mTop: SystemTheme.scale(5),
            textAlign: TextAlign.center,
            fontSize: 14, font: FontEnum.GMedium.toString(), letterSpacing: 0.2,
            textColor: AppColor.unSelectedTab,
          ),
        ],
      ),
    );
  }
}
