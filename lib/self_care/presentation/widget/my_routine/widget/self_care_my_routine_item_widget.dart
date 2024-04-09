import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_all_me_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_routine_item_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_manage_bottom_sheet.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_shared_widget.dart';

class SelfCareMyRoutineItemWidget extends ConsumerStatefulWidget {
  final int listIndex;

  const SelfCareMyRoutineItemWidget({
    required this.listIndex,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SelfCareMyRoutineItemWidget> createState() =>
      _SelfCareGoalRoutineItemWidgetState();
}

class _SelfCareGoalRoutineItemWidgetState
    extends ConsumerState<SelfCareMyRoutineItemWidget> {
  @override
  Widget build(BuildContext context) {
    final routineAllMeState = ref.watch(selfCareMyRoutineAllMeRoutineProvider);
    final item = routineAllMeState.routineList[widget.listIndex];
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
                  "${item.routineStatus!.isArchived! ? "보관중" : "사용중"} | ${item.dayOfWeeks.map((str) => str[0]).join(", ")}",
                  item.routineStatus!.isArchived!
                      ? MaeumgagymColor.gray400
                      : MaeumgagymColor.blue500,
                ),
              ],
            ),
            Row(
              children: [
                item.routineStatus!.isShared!
                    ? const SelfCareMyRoutineSharedWidget()
                    : const SizedBox(),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SelfCareMyRoutineManageBottomSheet(
                          index: widget.listIndex,
                        );
                      },
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/image/core_icon/dots_vertical_icon.svg",
                    color: MaeumgagymColor.gray400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
