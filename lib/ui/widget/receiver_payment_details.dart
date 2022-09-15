import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/ui/widget/payment_details_step.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class ReceiverPaymentDetails extends StatelessWidget {
  const ReceiverPaymentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AppText(title: 'Payment details',
            fontSize: 12,
            font: FontEnum.GMedium.toString(),
            letterSpacing: 0.2,
            mTop: SystemTheme.scale(35),
            textColor: AppColor.lightLabel,
          ),
        ),

        const PaymentDetailsStep(paymentFrom: 'Bank Account', enabled: true),
        const PaymentDetailsStep(mTop : 20, paymentFrom: 'Cash Pickup', enabled: false),

      ],
    );
  }
}
