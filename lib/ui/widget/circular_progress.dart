import 'package:flutter/material.dart';
class CircularProgressLoader extends StatelessWidget {
  const CircularProgressLoader({Key? key, this.color, this.height = 50, this.width= 50}) : super(key: key);

  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
            child: SizedBox(
              height: height,
               width: width,
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                  color ?? Colors.white,
               ),
              strokeWidth: 4.0),
            ),
          );
  }
}

