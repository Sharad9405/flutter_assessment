import 'package:domain/constants/enum/text_variant.dart';
import 'package:synergy/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/di/payment/payment_modules.dart';
import 'package:synergy/feature/payment/payment_page_view.dart';
import 'package:synergy/feature/payment/payment_page_viewmodel.dart';
import 'package:synergy/ui/molecules/header.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/theme/color_scheme.dart';

class PaymentPage extends BasePage<PaymentPageViewModel> {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends BaseStatefulPage<PaymentPageViewModel, PaymentPage> with TickerProviderStateMixin{

  @override
  Color? get backgroundColor => AppColor.colorF9FAFB;

  @override
  Color? get statusBarColor => AppColor.colorF9FAFB;

  @override
  void onModelReady(PaymentPageViewModel model) {
    model.tabController = TabController(length: 2, vsync: this);
  }

  @override
  ProviderBase provideBase() => paymentViewModelProvider;


  @override
  PreferredSizeWidget? buildAppbar() {
    return Header(title: 'Regular Payment', font: FontEnum.Gilroy.toString(), fontSize: 18,
      letterSpacing: 0.5, fontWeight: FontWeight.w600, backgroundColor: AppColor.colorF9FAFB,
      leadingIcon: AssetUtils.iconBack ,onLeadingClick: () => Navigator.pop(context),);
  }

  @override
  Widget buildView(BuildContext context, PaymentPageViewModel model) {
    return PaymentPageView(provideBase(),);
  }
}
