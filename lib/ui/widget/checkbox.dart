import 'package:flutter/material.dart';
import 'package:synergy/utils/theme/color_scheme.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class Checkbox extends StatelessWidget {
  final double? mLeft;
  final double? mRight;
  final double? mTop;
  final double? mBottom;
  final bool? enabled;

  const Checkbox({Key? key, this.mLeft= 0, this.mRight=0, this.mTop=0, this.mBottom=0, this.enabled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(mLeft!, mTop!, mRight!, mBottom!),
      width: SystemTheme.scale(18),
      height: SystemTheme.scale(18),

      decoration: BoxDecoration(
          color: AppColor.checkboxDisabled,
        border: Border.all(
            width: SystemTheme.scale(1.5)
        ),
        borderRadius: const BorderRadius.all(
            Radius.circular(6.0) //                 <--- border radius here
        ),

      ),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.lightGreyEFEFEF,
          borderRadius: BorderRadius.all(
              Radius.circular(4.0) //                 <--- border radius here
          ),
        ),
        child: Container(
          width: SystemTheme.scale(8),
          height: SystemTheme.scale(8),
          margin: EdgeInsets.all(SystemTheme.scale(3)),
          decoration: BoxDecoration(
            color: enabled == true ? AppColor.enabledColor : AppColor.lightGreyEFEFEF,
              borderRadius: const BorderRadius.all(
                  Radius.circular(4.0) //                 <--- border radius here
              ),
              shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}
