import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareMyRoutineButton extends StatelessWidget {
  final double width;
  final double height;
  final double imageWidth;
  final double imageHeight;
  final String imagePath;
  final String title;
  final Color buttonColor;
  final Color imageColor;
  final Color textColor;

  const SelfCareMyRoutineButton({
    super.key,
    required this.width,
    required this.height,
    required this.imageWidth,
    required this.imageHeight,
    required this.imagePath,
    required this.title,
    required this.buttonColor,
    required this.imageColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              width: imageHeight,
              height: imageWidth,
              color: imageColor,
            ),
            const SizedBox(width: 8),
            PtdTextWidget.labelLarge(
              title,
              textColor,
            ),
          ],
        ),
      ),
    );
  }
}
