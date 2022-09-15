import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:synergy/utils/theme/system_theme.dart';

class DottedContainer extends StatelessWidget {
  const DottedContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SystemTheme.scale(5)),
      child: DottedBorder(
        color: Colors.grey,
        strokeWidth: 1,
        dashPattern: const [10,6],
        borderType: BorderType.RRect,
        radius: Radius.circular(SystemTheme.scale(6)),
        child: child,
      ),
    );
  }
}
