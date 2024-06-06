import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_my_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_shared_widget.dart';

class SelfCareMyRoutineDetailTitleWidget extends ConsumerWidget {
  final int listIndex;

  const SelfCareMyRoutineDetailTitleWidget({
    super.key,
    required this.listIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myRoutineState = ref.watch(selfCareMyRoutineMyRoutinesProvider);
    final item = myRoutineState.routineList[listIndex];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PtdTextWidget.titleLarge(
                item.routineName.toString(),
          
                /// 임의의 값
                MaeumgagymColor.black,
              ),
              const SizedBox(height: 12),
              if (!item.routineStatus!.isArchived!)
                PtdTextWidget.bodyMedium(
                  item.dayOfWeeks.isEmpty ? "사용중" : "사용중 | ${item.dayOfWeeks.map((str) => str[0]).join(", ")}",
                  MaeumgagymColor.blue500,
                )
            ],
          ),
        ),
        if (item.routineStatus!.isShared!)
          SelfCareMyRoutineSharedWidget(color: MaeumgagymColor.blue50),
      ],
    );
  }
}
