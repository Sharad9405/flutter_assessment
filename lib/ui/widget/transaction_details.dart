import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/widget/custom_divider.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AppText(title: 'Transaction Details',
            fontSize: 12,
            font: FontEnum.GMedium.toString(),
            letterSpacing: 0.2,
            mTop: SystemTheme.scale(35),
            textColor: AppColor.lightLabel,
          ),
        ),

        Container(
          height: SystemTheme.scale(56),
          padding: EdgeInsets.fromLTRB(SystemTheme.scale(15),SystemTheme.scale(5),SystemTheme.scale(20), SystemTheme.scale(5)),
          margin: EdgeInsets.only(top: SystemTheme.scale(12),),
          decoration: BoxDecoration(
            border: Border.all(width: SystemTheme.scale(1), color: AppColor.enabledColor,),
            borderRadius: BorderRadius.circular(SystemTheme.scale(7)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(title: 'You send',
                      fontSize: 12,
                      font: FontEnum.GRegular.toString(),
                      letterSpacing: 0.2,
                      textColor: AppColor.enabledColor,
                    ),
                    AppText(title: '100.00',
                      fontSize: 14,
                      font: FontEnum.GRegular.toString(),
                      letterSpacing: 0.2,
                      textColor: AppColor.color6E6E6E,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: SystemTheme.scale(18)),
                  child: CustomDivider(height: SystemTheme.scale(20),)),

              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                      ImageUtil.assetSvg(assetName: AssetUtils.flagFour,
                        width: SystemTheme.scale(18),
                        fit: BoxFit.cover,
                        height: SystemTheme.scale(18),),
                  AppText(title: 'GBP',
                    fontSize: 18,
                    font: FontEnum.GRegular.toString(),
                    letterSpacing: 0.2,
                    mLeft: SystemTheme.scale(7), mRight: SystemTheme.scale(10),
                    textColor: AppColor.color6E6E6E,
                  ),

                  Transform.rotate(
                    angle: 4.7,
                    child: ImageUtil.assetSvg(assetName: AssetUtils.iconBack,
                      width: SystemTheme.scale(15),
                      height: SystemTheme.scale(10),
                      color: AppColor.color6E6E6E,
                    ),
                  )],
              )
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: SystemTheme.scale(21)),
          child: const Align(
              alignment: Alignment.topLeft,
              child: CustomDivider(height: 23,)),
        ),
        Padding(
            padding: EdgeInsets.only(left: SystemTheme.scale(12)),
            child: Row(
              children: [
                Icon(Icons.add_circle_outline_outlined,
                    color: AppColor.dividerColor,
                size: SystemTheme.scale(20),
                ),
                SizedBox(width: SystemTheme.scale(10),),
                AppText(
                  title:'£3.25',
                  fontSize: 14,
                  font: FontEnum.GRegular.toString(),
                  textColor: AppColor.color6E6E6E,
                ),
                const Spacer(),
                AppText(
                  title:'Transaction fees',
                  fontSize: 14,
                  font: FontEnum.GRegular.toString(),
                  textColor: AppColor.color6E6E6E,
                ),
              ],
            )),

        Padding(
          padding: EdgeInsets.only(left: SystemTheme.scale(21)),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: CustomDivider(height: 28,)),
        ),
        Padding(
            padding: EdgeInsets.only(left: SystemTheme.scale(12)),
            child: Row(
              children: [
                Icon(Icons.add_circle_outline_outlined,
                  color: AppColor.dividerColor,
                  size: SystemTheme.scale(20),
                ),
                SizedBox(width: SystemTheme.scale(10),),
                AppText(
                  title:'£100.00',
                  fontSize: 14,
                  font: FontEnum.GRegular.toString(),
                  textColor: AppColor.color6E6E6E,
                ),
                const Spacer(),
                AppText(
                  title:'will be converted',
                  fontSize: 14,
                  font: FontEnum.GRegular.toString(),
                  textColor: AppColor.color6E6E6E,
                ),
              ],
            )),

        Padding(
          padding: EdgeInsets.only(left: SystemTheme.scale(21)),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: CustomDivider(height: 28,)),
        ),
        Padding(
            padding: EdgeInsets.only(left: SystemTheme.scale(12)),
            child: Row(
              children: [
                Icon(Icons.add_circle_outline_outlined,
                  color: AppColor.dividerColor,
                  size: SystemTheme.scale(20),
                ),
                SizedBox(width: SystemTheme.scale(10),),
                AppText(
                  title:'1.385279',
                  fontSize: 14,
                  font: FontEnum.GRegular.toString(),
                  textColor: AppColor.color6E6E6E,
                ),
                const Spacer(),
                AppText(
                  title:'Exchange rate',
                  fontSize: 14,
                  font: FontEnum.GRegular.toString(),
                  textColor: AppColor.color6E6E6E,
                ),
              ],
            )),

        Padding(
          padding: EdgeInsets.only(left: SystemTheme.scale(21)),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: CustomDivider(height: 20,)),
        ),

        Container(
          height: SystemTheme.scale(56),
          padding: EdgeInsets.fromLTRB(SystemTheme.scale(15),SystemTheme.scale(5),SystemTheme.scale(20), SystemTheme.scale(5)),
          margin: EdgeInsets.only(top: SystemTheme.scale(0),),
          decoration: BoxDecoration(
            border: Border.all(width: SystemTheme.scale(1),color: AppColor.enabledColor,),
            borderRadius: BorderRadius.circular(SystemTheme.scale(7)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(title: 'Recipient gets',
                      fontSize: 12,
                      font: FontEnum.GRegular.toString(),
                      letterSpacing: 0.2,
                      textColor: AppColor.enabledColor,
                    ),
                    AppText(title: '138.50',
                      fontSize: 14,
                      pTop: 0,
                      font: FontEnum.GRegular.toString(),
                      letterSpacing: 0.2,
                      textColor: AppColor.color6E6E6E,
                    ),
                  ],
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(right: SystemTheme.scale(18)),
                  child: CustomDivider(height: SystemTheme.scale(20),)),

              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageUtil.assetSvg(assetName: AssetUtils.flagFive,
                    width: SystemTheme.scale(18),
                    fit: BoxFit.cover,
                    height: SystemTheme.scale(18),),
                  AppText(title: 'USD',
                    fontSize: 18,
                    font: FontEnum.GRegular.toString(),
                    letterSpacing: 0.2,
                    mLeft: SystemTheme.scale(7), mRight: SystemTheme.scale(10),
                    textColor: AppColor.color6E6E6E,
                  ),

                  Transform.rotate(
                    angle: 4.7,
                    child: ImageUtil.assetSvg(assetName: AssetUtils.iconBack,
                        width: SystemTheme.scale(15),
                        height: SystemTheme.scale(10),
                      color: AppColor.color6E6E6E,
                    ),
                  )],
              )
            ],
          ),
        ),

      ],
    );
  }
}
