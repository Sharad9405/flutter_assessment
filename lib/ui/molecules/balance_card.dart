import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/molecules/equivalent_current_widget.dart';
import 'package:synergy/ui/widget/custom_divider.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: "Your Balance",
          fontSize: 20,
          mTop: SystemTheme.scale(20),
          font: FontEnum.GBold.toString(),
          textColor: AppColor.anchorLabel,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: SystemTheme.scale(15)),
          padding: EdgeInsets.symmetric(vertical: SystemTheme.scale(10), horizontal: SystemTheme.scale(24)),
          width: SystemTheme.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SystemTheme.scale(20)),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    AppText(
                      title: "Hello, Saurav",
                      fontSize: 16,
                      font: FontEnum.GBold.toString(),
                      textColor: AppColor.anchorLabel,
                  ),
                  AppText(
                    title: "January 27, 2022",
                    fontSize: 10,
                    font: FontEnum.GRegular.toString(),
                    textColor: AppColor.anchorLabel,
                  ),
                ],
              ),

              AppText(
                title: "£ 21,860.02",
                fontSize: 28,
                font: FontEnum.GExtraBold.toString(),
                textColor: AppColor.anchorLabel,
                mTop: SystemTheme.scale(20),
              ),
              AppText(
                title: "Equivalent",
                fontSize: 12,
                font: FontEnum.GBold.toString(),
                textColor: AppColor.enabledColor,
                mTop: SystemTheme.scale(20),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CurrencyWidget(
                    imagePath: AssetUtils.flagOne,
                    text: "\$35,000",
                  ),
                  CustomDivider(),

                  CurrencyWidget(
                    imagePath: AssetUtils.flagThree,
                    text: "€25,000",
                  ),

                  CustomDivider(),

                  CurrencyWidget(
                    imagePath: AssetUtils.flagTwo,
                    text: "\$45,000",
                  ),
                ],
              ),
            ],
          ),
        ),

      ],
    );
  }
}
