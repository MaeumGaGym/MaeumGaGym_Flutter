import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';

import '../../../../../../../config/maeumgagym_color.dart';
import '../../../../../text/pretendard/ptd_text_widget.dart';
import '../../../provider/pose_tab_provider.dart';

class PoseRecommendWidgetTop extends ConsumerWidget {
  final String titleText;

  const PoseRecommendWidgetTop({
    super.key,
    required this.titleText,
  });

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
            /// 맨몸 운동 글씨
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: PtdTextWidget.titleMedium(
                "$titleText 운동",
                MaeumgagymColor.black,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () =>
              ref.read(poseTabController.notifier).setTabStateToName(titleText),
          child: Row(
            children: [
              PtdTextWidget.bodyMedium('더보기', MaeumgagymColor.gray400),
              const SizedBox(width: 8),
              ImageWidget(
                image: Images.chevronRight,
                width: 24,
                height: 24,
                color: MaeumgagymColor.gray200,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
