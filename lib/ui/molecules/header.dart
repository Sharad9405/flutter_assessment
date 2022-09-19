import 'package:domain/constants/enum/text_variant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synergy/utils/img_util.dart';
import 'package:synergy/ui/molecules/app_text.dart';
import 'package:synergy/utils/asset_utils.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  final double? height;
  final String title;
  final double pLeft;
  final double pRight;
  final Color? backgroundColor;
  final double? fontSize;
  final String? font;
  final FontWeight? fontWeight;
  final String leadingIcon;
  final String? suffixIcon;
  final double? letterSpacing;
  final double suffixIconWidth;
  final double suffixIconHeight;
  final bool showSuffix;
  final Function()? onLeadingClick;
  final Function()? onSuffixClick;


  const Header({Key? key, this.height = 60, required this.title, this.fontSize = 20,
    this.fontWeight = FontWeight.w600,
    this.font,
    this.pLeft = 10, this.pRight = 5,
    this.backgroundColor = AppColor.lightGreyEFEFEF,
    this.leadingIcon = AssetUtils.iconBack,
    this.suffixIcon,
    this.suffixIconWidth = 40, this.suffixIconHeight = 40,
    this.letterSpacing = 0.5,
    this.showSuffix = true,
    this.onLeadingClick,
    this.onSuffixClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: backgroundColor,
        width: SystemTheme.width,
        margin: const EdgeInsets.only(left: 0),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: SystemTheme.scale(pLeft)),
        child: Stack(
          children: [
            Positioned.fill(
              left: 0, top: 0,bottom: 0,right: 0,
              child: Center(
                child: AppText(
                  title: title,
                  fontSize: SystemTheme.scale(fontSize!),
                  fontWeight: fontWeight,
                  textColor: AppColor.header,
                  font: font ?? FontEnum.GRegular.toString(),
                  mLeft: 0,
                  letterSpacing: letterSpacing,
                ),
              ),
            ),
            Positioned(
              left: 0, top: 0,bottom: 0,
              child: CupertinoButton(
                onPressed: () => onLeadingClick?.call(),
                padding: EdgeInsets.zero,
                child: ImageUtil.assetSvg(assetName: leadingIcon,
                    fit: BoxFit.cover,
                    height: SystemTheme.scale(12.59),width: SystemTheme.scale(6)),
              ),
            ),

            if(showSuffix)
              Positioned(
                right: 0, top: 0,bottom: 0,
                child: Padding(
                  padding: EdgeInsets.only(right: SystemTheme.scale(pRight)),
                  child: Hero(
                    tag: 'logo',
                    child: CupertinoButton(
                      onPressed: () => onSuffixClick?.call(),
                      padding: EdgeInsets.zero,
                      child: ImageUtil.assetPng(name: suffixIcon ?? AssetUtils.iconUserDefaultPng,
                          height: SystemTheme.scale(suffixIconHeight), width: SystemTheme.scale(suffixIconWidth),
                      ),
                    ),
                  ),
                ),
              ),
          ],

        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SystemTheme.scale(height ?? kToolbarHeight));

}
