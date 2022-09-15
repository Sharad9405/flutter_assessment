import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/button/app_button.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/textfield/app_textfield.dart';
import 'package:synergy/ui/widget/custom_divider.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class AddBankDetails extends StatelessWidget {

  const AddBankDetails({Key? key,
    this.mLeft = 0, this.mTop = 10, this.mRight = 0, this.mBottom = 0,
    this.pHorizontal = 40, this. pVertical = 15, required this.onAddAccountClick,
  }) : super(key: key);

  final double mLeft;
  final double mTop;
  final double mRight;
  final double mBottom;
  final double pHorizontal;
  final double pVertical;
  final Function(String value) onAddAccountClick;

  @override
  Widget build(BuildContext context) {
    String accountNumber = '';

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                ImageUtil.assetSvg(assetName: AssetUtils.iconBankNumber,
                    width: SystemTheme.scale(26),
                    height: SystemTheme.scale(26), fit: BoxFit.cover),

                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      title: 'Bank Name',
                      fontSize: 16,
                      maxLine: 2,
                      mLeft: SystemTheme.scale(10),
                      font: FontEnum.GMedium.toString(),
                      textColor:  AppColor.colorC6CEDD,
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

            SizedBox(height: SystemTheme.scale(30),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ImageUtil.assetSvg(assetName: AssetUtils.iconAccountNumber,
                    width: SystemTheme.scale(26),
                    height: SystemTheme.scale(26), fit: BoxFit.cover),

                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AppTextField(
                      hintText: 'Account Number',
                      fontSize: 16,
                      borderColor: AppColor.transparent,
                      borderErrorColor: AppColor.transparent,
                      hintColor: AppColor.colorC6CEDD,
                      textColor: AppColor.color6E6E6E,
                      font: FontEnum.GMedium.toString(),
                      showOutLineInputBorder: false,
                      onChanged: (value){
                        accountNumber = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.fromLTRB( SystemTheme.scale(7),  SystemTheme.scale(7), 0, 0),
                child: CustomDivider(height: SystemTheme.scale(0.5), width: SystemTheme.width, color: AppColor.colorE3E8F1,)),

            SizedBox(height: SystemTheme.scale(30),),
            AppButton(
              text: 'Add Account',
              width: SystemTheme.width,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              onButtonTap: () => onAddAccountClick.call(accountNumber),
            ),
          ],
        ),
      ),
    );
  }
}
