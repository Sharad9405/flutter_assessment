import 'package:flutter/material.dart';
import 'package:synergy/base/base_view_model.dart';
import 'package:synergy/utils/theme/color_scheme.dart';

GlobalKey<NavigatorState> appLevelKey = GlobalKey(debugLabel: 'app-key');

class AppViewModel extends BaseViewModel {
  ThemeData _themeData = ThemeData();
  final AppTheme _appTheme = AppTheme.light;

  AppTheme get appTheme => _appTheme;

  final Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  /// for language selection
  // void toggleLocale(LanguageEnum locale) {
  //   print("toggleLocale $locale");
  //   _currentLocale = Locale(locale.toString());
  //   notifyListeners();
  // }

  ThemeData get themeData {
    // based on platform WidgetsBinding.instance.window.platformBrightness
    switch (_appTheme) {
      case AppTheme.dark:
      case AppTheme.light:
        _themeData = _themeData.copyWith(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColor.veryLightGrey,
          // accentColor: AppColor.white,
          primaryColor: AppColor.white,
          appBarTheme: const AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: AppColor.darkModerateBlue)),
          primaryColorDark: AppColor.darkModerateBlue,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColor.veryLightGrey,
            selectionHandleColor: AppColor.veryLightGrey,
            selectionColor: AppColor.veryLightGrey,
          ),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontFamily: "Gilroy",
                color: AppColor.white.withOpacity(0.3),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              //contentPadding: EdgeInsets.zero,
              filled: false,
              border: InputBorder.none,
              isCollapsed: true,
              errorStyle: const TextStyle(
                fontFamily: "Gilroy",
                color: AppColor.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              labelStyle: const TextStyle(
                fontFamily: "Gilroy",
                color: AppColor.black,
                fontSize: 18,
                height: 1.48,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          textTheme: _themeData.textTheme.apply(
              fontFamily: "Gilroy",
              bodyColor: AppColor.black,
              displayColor: AppColor.black),
          primaryTextTheme: _themeData.textTheme.apply(
              fontFamily: "Gilroy",
              bodyColor: AppColor.white,
              displayColor: AppColor.white),
          iconTheme: const IconThemeData(
            color: AppColor.white,
          ),
          indicatorColor: AppColor.white,
          buttonTheme: ButtonThemeData(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            textTheme: ButtonTextTheme.normal,
          ),
        );
        break;
    }
    return _themeData;
  }
}

enum AppTheme {
  dark,
  light,
}
