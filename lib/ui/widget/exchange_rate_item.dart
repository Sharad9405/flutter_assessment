import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/widget/custom_divider.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class ExchangeRateItem extends StatelessWidget {
  const ExchangeRateItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(20), vertical: SystemTheme.scale(15)),
      margin: EdgeInsets.only(bottom: SystemTheme.scale(15)),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(offset: Offset(2, 8), blurRadius: 48, spreadRadius: -16, color: Color.fromARGB(25, 0, 13, 26)),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageUtil.assetSvg(assetName: AssetUtils.flagOne, width: SystemTheme.scale(44),
                        height: SystemTheme.scale(35),),
                      AppText(title: 'USA', fontSize: 10,font: FontEnum.GBold.toString(), textColor: AppColor.listAnchorColor.withOpacity(0.5),)
                    ],
                  ),
                  CustomDivider(height: 16, pLeft: SystemTheme.scale(10), pRight: SystemTheme.scale(10), pTop: SystemTheme.scale(8),),
                  Column(
                    children: [
                      ImageUtil.assetSvg(assetName: AssetUtils.flagOne, width: SystemTheme.scale(44),
                        height: SystemTheme.scale(35),),
                      AppText(title: 'USA', fontSize: 10,font: FontEnum.GBold.toString(), textColor: AppColor.listAnchorColor.withOpacity(0.5),)
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(title: 'Buy', fontSize: 16,font: FontEnum.GMedium.toString(), textColor: AppColor.color000D1A,),
                      AppText(title: '1.45', fontSize: 12, mTop: SystemTheme.dp6, font: FontEnum.GBold.toString(), textColor: AppColor.enabledColor,)
                    ],
                  ),
                  SizedBox(width: SystemTheme.scale(30),),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(title: 'Sell', fontSize: 16,font: FontEnum.GMedium.toString(), textColor: AppColor.color000D1A,),
                      AppText(title: '1.46', fontSize: 12, mTop: SystemTheme.dp6, font: FontEnum.GBold.toString(), textColor: AppColor.color128807,)
                    ],
                  ),
                ],
              ),
            ],
          ),

          AppText(title: '12th January 2022   9:15 AM', fontSize: 12,font: FontEnum.GMedium.toString(),
            mTop: SystemTheme.dp20, textColor: AppColor.color243656,),
        ],
      ),
    );
  }
}
