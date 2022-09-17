import 'package:flutter/material.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key, this.width,  this.height,
    this.backgroundColor, this.childColor, required this.onPressed}) : super(key: key);

  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? childColor;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SystemTheme.dp5),
      child: SizedBox(
        width: SystemTheme.scale(width ?? 56),height: SystemTheme.scale(height ?? 56),
        child: FittedBox(
          child: FloatingActionButton(
              backgroundColor: backgroundColor ?? AppColor.color2F2E41,
              onPressed: () => onPressed?.call(),
              clipBehavior: Clip.hardEdge,
              child: ImageUtil.assetSvg(assetName: AssetUtils.iconSendMoney, color: childColor ?? AppColor.white)
          ),
        ),
      ),
    );
  }
}
