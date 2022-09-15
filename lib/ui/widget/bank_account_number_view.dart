import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/cupertino.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/widget/custom_divider.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class BankAccountNumberView extends StatelessWidget {
  const BankAccountNumberView({Key? key,
    this.mLeft = 0, this.mTop = 40, this.mRight = 0, this.mBottom = 0,
    this.pHorizontal = 15, this. pVertical = 15, required this.label, required this.title, this.showAddAccount = false,
    this.leadingIcon = AssetUtils.iconBankNumber,
    required this.onClick, this.onAddAccountClick,
  }) : super(key: key);

  final double mLeft;
  final double mTop;
  final double mRight;
  final double mBottom;
  final double pHorizontal;
  final double pVertical;
  final String label;
  final String title;
  final String leadingIcon;
  final bool showAddAccount;
  final Function(String value) onClick;
  final Function()? onAddAccountClick;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => onClick.call(title),
      padding: EdgeInsets.zero,
      child: Container(
        margin: EdgeInsets.fromLTRB(SystemTheme.scale(mLeft), SystemTheme.scale(mTop), SystemTheme.scale(mRight), SystemTheme.scale(mBottom)),
        padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(pHorizontal), vertical: SystemTheme.scale(pVertical),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ImageUtil.assetSvg(assetName: leadingIcon,
                    width: SystemTheme.scale(26),
                    height: SystemTheme.scale(26), fit: BoxFit.cover),

                Expanded(
                  child: Container(
                    height: SystemTheme.scale(50),
                    padding: EdgeInsets.symmetric(horizontal: SystemTheme.scale(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: AppText(
                            title: label,
                            fontSize: 10,
                            font: FontEnum.GMedium.toString(),
                            textColor: AppColor.colorC6CEDD,
                          ),
                        ),
                        Expanded(
                          child: AppText(
                            title: title,
                            fontSize: 12,
                            font: FontEnum.GBold.toString(),
                            fontWeight: FontWeight.w600,
                            textColor: AppColor.color333333,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Transform.rotate(
                  angle: 4.7,
                  child: ImageUtil.assetSvg(assetName: AssetUtils.iconBack,
                    width: SystemTheme.scale(15),
                    height: SystemTheme.scale(10),
                    color: AppColor.checkboxDisabled,
                  ),
                )

              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB( SystemTheme.scale(7),  SystemTheme.scale(7), 0, 0),
                child: CustomDivider(height: SystemTheme.scale(0.5), width: SystemTheme.width, color: AppColor.colorE3E8F1,)),

            if(showAddAccount)
            CupertinoButton(
              onPressed: () => onAddAccountClick?.call(),
              padding: EdgeInsets.zero,
              child: Align(
                alignment: Alignment.centerRight,
                child: AppText(
                  title: '+ Add Account',
                  fontSize: 14, font: FontEnum.GMedium.toString(),
                  textColor: AppColor.enabledColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
