import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

import '../../../../../core/component/image/images.dart';

class HomeMainRoutineTitle extends StatelessWidget {
  final String title;
  final String? routineName;
  final bool? routineIsComplete;

  const HomeMainRoutineTitle({
    super.key,
    required this.title,
    this.routineName,
    this.routineIsComplete,
  });

  @override
  Widget build(BuildContext context) {
    if (routineName == null || routineIsComplete == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PtdTextWidget.titleMedium(
              title,
              MaeumgagymColor.black,
            ),
            ImageWidget(
              image: Images.chevronRight,
              width: 24,
              height: 24,
              color: MaeumgagymColor.gray200,
            ),
          ],
        ),
      );
    } else {
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
                    routineIsComplete!
                        ? ImageWidget(
                            image: Images.iconsCheckCircle,
                            imageWidth: 24,
                            imageHeight: 24,
                            color: MaeumgagymColor.blue500,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                const SizedBox(height: 4),
                PtdTextWidget.bodyMedium(routineName!, MaeumgagymColor.gray500),
              ],
            ),
            ImageWidget(
              image: Images.chevronRight,
              width: 24,
              height: 24,
              color: MaeumgagymColor.gray200,
            ),
          ],
        ),
      );
    }
  }
}
