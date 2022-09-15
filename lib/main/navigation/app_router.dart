import 'package:flutter/cupertino.dart';
import 'package:synergy/feature/exchange_rate/exchange_rate_page.dart';
import 'package:synergy/feature/home/home_page.dart';
import 'package:synergy/feature/payment/payment_page.dart';
import 'package:synergy/feature/payment_setup/payment_setup_success.dart';
import 'package:synergy/feature/schedule/schedule_page.dart';
import 'package:synergy/feature/splash/splash_page.dart';
import 'package:synergy/feature/verify_opt/verify_otp_page.dart';
import 'package:synergy/main/navigation/route_paths.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return CupertinoPageRoute(
            builder: (context) => const SplashPage(),
            settings: const RouteSettings(name: RoutePaths.splash));
      case RoutePaths.home:
        return CupertinoPageRoute(
            builder: (context) => const HomePage(),
            settings: const RouteSettings(name: RoutePaths.home));
      case RoutePaths.payment:
        return CupertinoPageRoute(
            builder: (context) => const PaymentPage(),
            settings: const RouteSettings(name: RoutePaths.payment));
      case RoutePaths.schedule:
        return CupertinoPageRoute(
            builder: (context) => const SchedulePage(),
            settings: const RouteSettings(name: RoutePaths.schedule));
      case RoutePaths.exchangeRate:
        return CupertinoPageRoute(
            builder: (context) => const ExchangeRatePage(),
            settings: const RouteSettings(name: RoutePaths.exchangeRate));
      case RoutePaths.verifyOtp:
        return CupertinoPageRoute(
            builder: (context) => const VerifyOtpPage(),
            settings: const RouteSettings(name: RoutePaths.verifyOtp));
      case RoutePaths.paymentSetupSuccess:
        return CupertinoPageRoute(
            builder: (context) => const PaymentSetupSuccessPage(),
            settings: const RouteSettings(name: RoutePaths.paymentSetupSuccess));

      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
