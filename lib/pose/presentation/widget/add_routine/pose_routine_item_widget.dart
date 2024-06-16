import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/provider/routine_my_routine_my_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/widget/routine_my_routine_shared_widget.dart';

class PoseRoutineItemWidget extends ConsumerStatefulWidget {
  final int listIndex;

  const PoseRoutineItemWidget({
    required this.listIndex,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<PoseRoutineItemWidget> createState() =>
      _PoseRoutineItemWidgetState();
}

class _PoseRoutineItemWidgetState extends ConsumerState<PoseRoutineItemWidget> {
  @override
  Widget build(BuildContext context) {
    final myRoutineState = ref.watch(routineMyRoutinesProvider);
    final item = myRoutineState.routineList[widget.listIndex];
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MaeumgagymColor.blue50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PtdTextWidget.labelLarge(
                  item.routineName.toString(),
                  MaeumgagymColor.black,
                ),
                const SizedBox(height: 4),
                PtdTextWidget.bodySmall(
                  (item.routineStatus!.isArchived! ? "보관중" : "사용중") +
                      (item.dayOfWeeks.isNotEmpty
                          ? " | ${item.dayOfWeeks.map((str) => str[0]).join(", ")}"
                          : ""),
                  item.routineStatus!.isArchived!
                      ? MaeumgagymColor.gray400
                      : MaeumgagymColor.blue500,
                ),
              ],
            ),
            item.routineStatus!.isShared!
                ? const RoutineMyRoutineSharedWidget()
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
