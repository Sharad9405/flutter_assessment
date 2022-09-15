import 'package:flutter/material.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class ShowMoreWidget extends StatelessWidget {
  const ShowMoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: SystemTheme.scale(5),
            width: SystemTheme.scale(5),
            decoration: BoxDecoration(
                color: AppColor.black.withOpacity(0.5), shape: BoxShape.circle),
          ),
           SizedBox(width: SystemTheme.scale(5),),
          Container(
            height: SystemTheme.scale(5),
            width: SystemTheme.scale(5),
            decoration: BoxDecoration(
                color: AppColor.black.withOpacity(0.5), shape: BoxShape.circle),
          ),
          SizedBox(width: SystemTheme.scale(5),),
          Container(
            height: SystemTheme.scale(5),
            width: SystemTheme.scale(5),
            decoration: BoxDecoration(
                color: AppColor.black.withOpacity(0.5), shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }
}
