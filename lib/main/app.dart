import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:synergy/base/base_widget.dart';
import 'package:synergy/di/app/app_modules.dart';
import 'package:synergy/generated/l10n.dart';
import 'package:synergy/main/app_viewmodel.dart';
import 'package:synergy/main/navigation/app_router.dart';
import 'package:synergy/main/navigation/route_paths.dart';

class App extends ConsumerWidget {
  late AppViewModel _appViewModel;

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return BaseWidget<AppViewModel>(
      providerBase: appViewModel,
      onModelReady: (model) {
        _appViewModel = ref.watch(appViewModel);
      },
      builder: (context, appModel, child) {
        return MaterialApp(
            navigatorKey: appLevelKey,
            builder: (context, widget) => ResponsiveWrapper.builder(
                  ClampingScrollWrapper.builder(context, widget!),
                  maxWidth: 1400,
                  minWidth: 360,
                  defaultScale: true,
                  breakpoints: const [
                    ResponsiveBreakpoint.resize(360, name: MOBILE),
                    ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                    ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                    ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                  ],
                ),
            localizationsDelegates:  const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            locale: _appViewModel.currentLocale,
            supportedLocales: S.delegate.supportedLocales,
            onGenerateTitle: (context) => S.of(context).appName,
            debugShowCheckedModeBanner: false,
            initialRoute: RoutePaths.splash,
            theme: _appViewModel.themeData,
            onGenerateRoute: AppRouter.generateRoute);
      },
    );
  }
}
