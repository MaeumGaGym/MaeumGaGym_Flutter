import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class MaeumgagymButton extends StatelessWidget {
  final double width, height, fontSize;
  final bool useRoute, isCircular;
  final String text;
  final Color color, fontColor;
  final Future<Object?> isRoute;

  const MaeumgagymButton({
    required this.text,
    required this.fontSize,
    required this.fontColor,
    required this.width,
    required this.height,
    required this.color,
    required this.isCircular,
    required this.useRoute,
    required this.isRoute,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => useRoute ? isRoute : '',
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
