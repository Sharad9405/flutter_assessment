import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:synergy/di/app/app_modules.dart';
import 'package:synergy/main/app_viewmodel.dart';

class ImageUtil {
  ImageUtil._();

  static Widget assetSvg(
      {required String assetName,
      double? width,
      String? darkAssetName,
      double? height,
      BoxFit fit = BoxFit.contain,
      Color? color,
      alignment = Alignment.center,
      BlendMode colorBlendMode = BlendMode.srcIn,
      String? semanticsLabel,
      }) {

  /*
    if (kIsWeb) {
      return Consumer(
        builder: (context, ref, child) => Image.network(
          darkAssetName != null
              ? (ref.watch(appViewModel).appTheme == AppTheme.dark
                  ? darkAssetName
                  : assetName)
              : assetName,
          width: width,
          height: height,
          fit: fit,
          color: color,
          alignment: alignment,
        ),
      );
    }

    */
    return Consumer(
      builder: (context, ref, child) => SvgPicture.asset(
        darkAssetName != null
            ? (ref.watch(appViewModel).appTheme == AppTheme.dark
            ? darkAssetName
            : assetName)
            : assetName,
        width: width,
        matchTextDirection: true,
        height: height,
        fit: BoxFit.fill,
        color: color,
        alignment: alignment,
        colorBlendMode: colorBlendMode,
        semanticsLabel: semanticsLabel,
      ),
    );
  }

  static Widget assetPng({required String name, double? width,
      double? height, BoxFit? fit,Function()? onClick}){
    return CupertinoButton(
      onPressed: () => onClick?.call(),
      padding: EdgeInsets.zero,
      child: Image.asset(name,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
      ),
    );
  }



}
