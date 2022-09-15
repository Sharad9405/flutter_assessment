import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/base/base_page.dart';
import 'package:synergy/di/splash/splash_modules.dart';
import 'package:synergy/feature/splash/splash_page_view.dart';
import 'package:synergy/feature/splash/splash_page_viewmodel.dart';
import 'package:synergy/utils/theme/color_scheme.dart';

/// This is the Splash Screen Widget
class SplashPage extends BasePage<SplashPageViewModel> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

/// This is the Splash Screen Widget State
class SplashPageState extends BaseStatefulPage<SplashPageViewModel, SplashPage> {

  @override
  Color? get backgroundColor => AppColor.colorF9FAFB;

  @override
  Color? get statusBarColor => AppColor.colorF9FAFB;


  @override
  void onModelReady(SplashPageViewModel model) {
  }

  @override
  ProviderBase provideBase() => splashViewModelProvider;

  @override
  Widget buildView(BuildContext context, SplashPageViewModel model) {
    return SplashPageView(provideBase());
  }
}
