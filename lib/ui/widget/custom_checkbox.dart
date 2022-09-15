import 'package:flutter/material.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({Key? key, this.width = 15, this.height = 15,
    this.outerIconWidth = 15, this.outerIconHeight = 15, this.innerIconWidth = 6, this.innerIconHeight = 6,
    this.outerIconFit = BoxFit.cover, this.innerIconFit = BoxFit.cover,
    this.enabled = false,
  }) : super(key: key);

  final double width;
  final double height;
  final double outerIconWidth;
  final double outerIconHeight;
  final double innerIconWidth;
  final double innerIconHeight;
  final BoxFit outerIconFit;
  final BoxFit innerIconFit;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SystemTheme.scale(width),
      height: SystemTheme.scale(height),
      child: Stack(
        children: [
          Positioned.fill(child: Center(
            child: ImageUtil.assetSvg(assetName: AssetUtils.iconCheckboxHolo, fit: outerIconFit,
              width: SystemTheme.scale(outerIconWidth), height: SystemTheme.scale(outerIconHeight),),
          )),
          if(enabled)
          Positioned.fill(child: Center(
            child: ImageUtil.assetSvg(assetName: AssetUtils.iconCheckboxDot, fit: innerIconFit,
              width: SystemTheme.scale(innerIconWidth), height: SystemTheme.scale(innerIconHeight),),
          ))
        ],
      ),
    );
  }
}
