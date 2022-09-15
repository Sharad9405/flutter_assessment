import 'package:domain/constants/enum/text_variant.dart';
import 'package:synergy/base/base_page.dart';
import 'package:synergy/di/exchange_rate/exchange_rate_module.dart';
import 'package:synergy/feature/exchange_rate/exchange_rate_page_view.dart';
import 'package:synergy/feature/exchange_rate/exchange_rate_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/ui/molecules/header.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/theme/color_scheme.dart';

class ExchangeRatePage extends BasePage<ExchangeRatePageViewModel> {
  const ExchangeRatePage({Key? key}) : super(key: key);

  @override
  ExchangeRatePageState createState() => ExchangeRatePageState();
}

class ExchangeRatePageState extends BaseStatefulPage<ExchangeRatePageViewModel, ExchangeRatePage> {

  @override
  Color? get backgroundColor => AppColor.colorF9FAFB;

  @override
  Color? get statusBarColor => AppColor.colorF9FAFB;

  @override
  void onModelReady(ExchangeRatePageViewModel model) {}

  @override
  ProviderBase provideBase() => exchangeRateViewModelProvider;


  @override
  PreferredSizeWidget? buildAppbar() {
    return Header(title: 'Exchange Rate', backgroundColor: AppColor.colorF9FAFB, font: FontEnum.GMedium.toString(), fontSize: 18, pRight: 0,
      fontWeight: FontWeight.w600, leadingIcon: AssetUtils.iconBack, suffixIcon: AssetUtils.iconMoreVer, suffixIconWidth: 22, suffixIconHeight: 22.57,
      onLeadingClick: () => Navigator.pop(context),);
  }

  @override
  Widget buildView(BuildContext context, ExchangeRatePageViewModel model) {
    return ExchangeRatePageView(provideBase());
  }
}
