import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/widget/custom_checkbox.dart';
import 'package:synergy/ui/widget/custom_divider.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class PaymentDetailsStep extends StatelessWidget {
  const PaymentDetailsStep({Key? key,
    this.mLeft = 0, this.mTop = 25, this.mRight = 0, this.mBottom = 0,
    this.paymentBy = 'Payment by', required this.paymentFrom, required this.enabled,
  }) : super(key: key);

  final double mLeft;
  final double mTop;
  final double mRight;
  final double mBottom;
  final String paymentBy;
  final String paymentFrom;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: SystemTheme.scale(mTop),),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageUtil.assetSvg(assetName: AssetUtils.iconNote,
                  width: SystemTheme.scale(17.29),
                  height: SystemTheme.scale(14.21), fit: BoxFit.cover),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(7)),
                  child: CustomDivider(height: SystemTheme.scale(15), width: SystemTheme.scale(0.5),)),

              AppText(title: paymentBy,
                fontSize: 10,
                font: FontEnum.GBold.toString(),
                letterSpacing: 0.05,
                mLeft: SystemTheme.scale(7),
                textColor: AppColor.label,
              ),
              AppText(title: paymentFrom,
                fontSize: 10,
                font: FontEnum.GBold.toString(),
                letterSpacing: 0.05,
                mLeft: SystemTheme.scale(3),
                textColor: AppColor.enabledColor,
              ),
            ],
          ),

          CustomCheckbox(enabled: enabled,),
        ],
      ),
    );
  }
}
