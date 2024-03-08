import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/provider/pose_tab_provider.dart';

import '../../../../../../config/maeumgagym_color.dart';
import '../../../../text/pretendard/ptd_text_widget.dart';

class PoseRecommendTop extends ConsumerWidget {
  final String titleImage, titleText;
  final int index;

  const PoseRecommendTop(
      {super.key,
      required this.titleImage,
      required this.titleText,
      required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            Image.asset(
              titleImage,
              width: 40,
              height: 40,
            ),

            /// 맨몸 운동 글씨
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: PtdTextWidget.titleMedium(
                  "$titleText 운동", MaeumgagymColor.black),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => ref.read(poseTabController.notifier).state = index,
          child: Row(
            children: [
              PtdTextWidget.bodyMedium('더보기', MaeumgagymColor.gray400),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                child: SvgPicture.asset(
                  "assets/image/pose_icon/ios_right_arrow.svg",
                  width: 6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
