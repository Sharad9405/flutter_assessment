import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/base/base_page.dart';
import 'package:synergy/feature/payment_setup/payment_setup_success_page_viewmodel.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class PaymentSetupSuccessPageView extends BasePageViewWidget<PaymentSetupSuccessPageViewModel> {
  const PaymentSetupSuccessPageView(ProviderBase model, {Key? key}) : super(model, key: key);


  @override
  Widget build(BuildContext context, model) {
    return Container(
      color: AppColor.transparent,
      width: SystemTheme.width,
      margin: EdgeInsets.only(top: SystemTheme.scale(100)),
      height: SystemTheme.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(title: 'Payment Setup\nSuccessful',
            fontSize: 20, font: FontEnum.GBold.toString(),
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
            mBottom: SystemTheme.scale(75),
            textColor: AppColor.enabledColor,
          ),

          ImageUtil.assetSvg(assetName: AssetUtils.imgPaymentSuccess, width: SystemTheme.scale(224),
          height: SystemTheme.scale(171), fit: BoxFit.cover)
        ],
      ),
    );
  }
}
