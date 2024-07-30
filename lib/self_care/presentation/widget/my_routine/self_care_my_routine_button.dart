import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareMyRoutineButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Color buttonColor;
  final Color textColor;

  final double? imageWidth;
  final double? imageHeight;
  final String? imagePath;
  final Color? imageColor;

  const SelfCareMyRoutineButton({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.buttonColor,
    required this.textColor,
    this.imageWidth,
    this.imageHeight,
    this.imagePath,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// image를 쓰는지 안 쓰는지 체크
          if (imagePath != null)
            ImageWidget(
              image: imagePath!,
              width: imageHeight,
              height: imageWidth,
              color: imageColor,
            ),
          /// 이미지를 안쓰면 간격 x
          SizedBox(width: imagePath != null ? 8 : 0),
          PtdTextWidget.labelLarge(
            title,
            textColor,
          ),
        ],
      ),
    );
  }
}
