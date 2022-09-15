import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/base/base_page.dart';
import 'package:synergy/di/payment_setup/payment_setup_module.dart';
import 'package:synergy/feature/payment_setup/payment_setup_success_page_view.dart';
import 'package:synergy/feature/payment_setup/payment_setup_success_page_viewmodel.dart';
import 'package:synergy/ui/molecules/header.dart';
import 'package:synergy/utils/theme/color_scheme.dart';


class PaymentSetupSuccessPage extends BasePage<PaymentSetupSuccessPageViewModel> {
  const PaymentSetupSuccessPage({Key? key}) : super(key: key);

  @override
  PaymentSetupSuccessPageState createState() => PaymentSetupSuccessPageState();
}

class PaymentSetupSuccessPageState extends BaseStatefulPage<PaymentSetupSuccessPageViewModel, PaymentSetupSuccessPage> {

  @override
  Color? get backgroundColor => AppColor.colorF9FAFB;

  @override
  Color? get statusBarColor => AppColor.colorF9FAFB;

  @override
  PreferredSizeWidget? buildAppbar() {
    return Header(title: 'Payment Setup Success', backgroundColor: AppColor.colorF9FAFB, showSuffix: false,
        fontSize: 16,fontWeight: FontWeight.w600,
        onLeadingClick: () => Navigator.pop(context));
  }

  @override
  ProviderBase provideBase() => paymentSetupSuccessViewModelProvider;


  @override
  Widget buildView(BuildContext context, PaymentSetupSuccessPageViewModel model) {
    return PaymentSetupSuccessPageView(provideBase());
  }
}
