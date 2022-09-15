import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SystemTheme {
  // - Gradient Colors
  static const List<Color> orangeGradient = [
    Color.fromRGBO(239, 110, 111, 1),
    Color.fromRGBO(242, 139, 160, 1)
  ];
  static const List<Color> blueGradient = [
    Color.fromRGBO(26, 106, 172, 1),
    Color.fromRGBO(18, 64, 109, 1)
  ];
  static const List<Color> matteBlueGradient = [
    Color.fromRGBO(102, 155, 200, 1),
    Color.fromRGBO(26, 106, 172, 1)
  ];

  // Theme
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      cardColor: Colors.white,
      canvasColor: Colors.white,
      backgroundColor: Colors.white,
      textTheme: const TextTheme(),
    );
  }

  // Dimensions
  /// The window to which this binding is bound.
  ui.SingletonFlutterWindow get window => ui.window;

  Locale? get deviceLocale => ui.window.locale;

  ///The number of device pixels for each logical pixel.
  static double get pixelRatio => ui.window.devicePixelRatio;

  static Size get size => ui.window.physicalSize / pixelRatio;

  ///The horizontal extent of this size.
  static double get width => size.width;

  ///The vertical extent of this size
  static double get height => size.height;

  ///The distance from the top edge to the first unpadded pixel,
  ///in physical pixels.
  static double get statusBarHeight1 => ui.window.padding.top;

  ///The distance from the bottom edge to the first unpadded pixel,
  ///in physical pixels.
  double get bottomBarHeight => ui.window.padding.bottom;
  static double guidelineBaseWidth = 360;
  static double guidelineBaseHeight = 640;
  static double screenWidth = width;
  static double screenHeight = height;
  static double statusBarHeight = statusBarHeight1;
  static double scale(double size) {
    return (screenWidth / guidelineBaseWidth) * size;
  }

  static double verticalScale(double size) {
    return (screenHeight / guidelineBaseHeight) * size;
  }

  static double moderateScale(double size, [double factor = 0.5]) {
    return size + (scale(size) - size) * factor;
  }

  // Spacing
  static double dp2 = scale(2);
  static double dp4 = scale(4);
  static double dp8 = scale(8);
  static double dp6 = scale(6);
  static double dp12 = scale(12);
  static double dp16 = scale(16);
  static double dp20 = scale(20);
  static double dp24 = scale(24);
  static double dp28 = scale(28);
  static double dp32 = scale(32);
  static double dp36 = scale(36);
  static double dp40 = scale(40);
  static double dp48 = scale(48);
  static double dp56 = scale(56);
}
