import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_routine_item_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_shared_widget.dart';

class SelfCareMyRoutineDetailTitleContainer extends ConsumerWidget {
  final int index;

  const SelfCareMyRoutineDetailTitleContainer({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isKeptState = ref.watch(selfCareRoutineItemProvider)[index].isKept;
    final isSharedState = ref.watch(selfCareRoutineItemProvider)[index].isShared;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PtdTextWidget.titleLarge(
              "루틴 이름", /// 임의의 값
              MaeumgagymColor.black,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (!isKeptState && isSharedState) PtdTextWidget.bodyMedium("사용중 • 공유됨", MaeumgagymColor.blue500)
                else if (!isKeptState) PtdTextWidget.bodyMedium("사용중", MaeumgagymColor.blue500)
                else if (isSharedState) PtdTextWidget.bodyMedium("공유됨", MaeumgagymColor.blue500)
              ],
            )
          ],
        ),
        if (isSharedState)
          SelfCareMyRoutineSharedWidget(color: MaeumgagymColor.blue50),
      ],
    );
  }
}
