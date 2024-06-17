import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class HomeMainRoutineTitle extends StatelessWidget {
  final String title, routineName;
  final bool routineIsComplete;

  const HomeMainRoutineTitle({
    super.key,
    required this.title,
    required this.routineName,
    required this.routineIsComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  PtdTextWidget.titleMedium(
                    title,
                    MaeumgagymColor.black,
                  ),
                  const SizedBox(width: 12),
                  routineIsComplete
                      ? const ImageWidget(
                          image:
                              "assets/image/home_icon/completed_circle_icon.svg",
                          imageType: ImageType.svg,
                          imageWidth: 24,
                          imageHeight: 24,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              const SizedBox(height: 4),
              PtdTextWidget.bodyMedium(routineName, MaeumgagymColor.gray500),
            ],
          ),
          GestureDetector(
            child: SvgPicture.asset(
              'assets/image/core_icon/right_arrow_icon.svg',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
