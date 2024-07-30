import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';

class HomeFunctionWidget extends StatelessWidget {
  final double size;
  final double padding;
  final String iconPath;
  final Color iconColor;
  final Color backgroundColor;

  const HomeFunctionWidget({
    super.key,
    required this.size,
    required this.backgroundColor,
    required this.padding,
    required this.iconColor,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: MaeumgagymColor.blue400,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: ImageWidget(
          image: iconPath,
          imageWidth: size,
          imageHeight: size,
          color: iconColor,
        ),
      ),
    );
  }
}
