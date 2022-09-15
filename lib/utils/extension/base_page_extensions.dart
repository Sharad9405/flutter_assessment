import 'package:fluttertoast/fluttertoast.dart';
import 'package:synergy/base/base_page.dart';
import 'package:synergy/ui/app_toast.dart';

extension PageExtensions on BaseStatefulPage {
  showShortToast(String message) {
    AppToast.showToast(message, duration: Toast.LENGTH_SHORT);
  }

  showLongToast(String message) {
    AppToast.showToast(message, duration: Toast.LENGTH_LONG);
  }
}
