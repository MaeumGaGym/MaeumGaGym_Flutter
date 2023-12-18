import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class MaeumgagymButton extends StatelessWidget {
  final double width, height, fontSize;
  final bool useRoute, isCircular, isGo;
  final String text, route;
  final Color color, fontColor;

  const MaeumgagymButton({
    required this.text,
    required this.fontSize,
    required this.fontColor,
    required this.width,
    required this.height,
    required this.color,
    required this.isCircular,
    required this.route,
    required this.isGo,
    required this.useRoute,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (useRoute) {
          if (isGo) {
            context.go(route);
          } else {
            context.push(route);
          }
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius:
              isCircular ? BorderRadius.circular(8) : BorderRadius.circular(0),
        ),
        child: Center(
          child: PtdTextWidget.medium(text, fontSize, fontColor),
        ),
      ),
    );
  }
}
