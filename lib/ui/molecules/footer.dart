import 'package:flutter/material.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key, this.height, this.imageWidth, this.imageHeight,
    required this.onPressed}) : super(key: key);

  final double? height;
  final double? imageWidth;
  final double? imageHeight;
  final Function(int index)? onPressed;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: SystemTheme.verticalScale(height ?? 70),
        child: Padding(
          padding:  EdgeInsets.only(top:SystemTheme.scale(10)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: GestureDetector(onTap: () => onPressed?.call(0),child: ImageUtil.assetSvg(assetName: AssetUtils.iconHome))),
                Expanded(child: GestureDetector(onTap: () => onPressed?.call(1),child: ImageUtil.assetSvg(assetName: AssetUtils.iconWallet))),
                Expanded(child: GestureDetector(onTap: () => onPressed?.call(2),child: ImageUtil.assetSvg(assetName: AssetUtils.iconGroup))),
                Expanded(child: GestureDetector(onTap: () => onPressed?.call(3),child: ImageUtil.assetSvg(assetName: AssetUtils.iconSetting))),
              ]),
        ),
      ),
    );
  }
}
