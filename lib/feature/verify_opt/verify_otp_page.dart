import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/base/base_page.dart';
import 'package:synergy/di/verify_otp/verify_otp_modules.dart';
import 'package:synergy/feature/verify_opt/verify_otp_page_view.dart';
import 'package:synergy/feature/verify_opt/verify_otp_page_viewmodel.dart';
import 'package:synergy/ui/molecules/header.dart';
import 'package:synergy/utils/theme/color_scheme.dart';


class VerifyOtpPage extends BasePage<VerifyOtpPageViewModel> {
  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  VerifyOtpPageState createState() => VerifyOtpPageState();
}

class VerifyOtpPageState extends BaseStatefulPage<VerifyOtpPageViewModel, VerifyOtpPage> {


  @override
  Color? get backgroundColor => AppColor.colorF9FAFB;

  @override
  Color? get statusBarColor => AppColor.colorF9FAFB;


  @override
  void onModelReady(VerifyOtpPageViewModel model) {
  }
  @override
  PreferredSizeWidget? buildAppbar() {
    return Header(title: '', backgroundColor: AppColor.colorF9FAFB, showSuffix: false,
        onLeadingClick: () => Navigator.pop(context));
  }


  @override
  ProviderBase provideBase() => verifyOtpViewModelProvider;


  @override
  Widget buildView(BuildContext context, VerifyOtpPageViewModel model) {
    return VerifyOtpPageView(provideBase());
  }
}
