import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';

import '../../../../component/image_widget.dart';

class TimerMetronomeButtonWidget extends StatelessWidget {
  final double width;
  final double padding;
  final String iconPath;
  final Color iconColor;
  final Color backgroundColor;

  const TimerMetronomeButtonWidget({
    super.key,
    required this.width,
    required this.backgroundColor,
    required this.padding,
    required this.iconColor,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: MaeumColor.blue400,
          width: 1.w,
        ),
      ),
      child: ImageWidget(
        image: iconPath,
        width: width,
        color: iconColor,
      ),
    );
  }
}