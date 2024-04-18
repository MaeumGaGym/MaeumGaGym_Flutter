import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_all_me_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_days_provider.dart';

class SelfCareMyRoutineDaysSelectWidget extends ConsumerStatefulWidget {
  final int listIndex;

  const SelfCareMyRoutineDaysSelectWidget({
    super.key,
    required this.listIndex,
  });

  @override
  ConsumerState<SelfCareMyRoutineDaysSelectWidget> createState() =>
      _SelfCareMyRoutineDaysSelectWidgetState();
}

class _SelfCareMyRoutineDaysSelectWidgetState
    extends ConsumerState<SelfCareMyRoutineDaysSelectWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final routineAllMeState = ref.watch(selfCareMyRoutineAllMeRoutineProvider);
      ref.read(selfCareMyRoutineDaysProvider.notifier).init(routineAllMeState.routineList[widget.listIndex].dayOfWeeks);
      final selectedDaysNotifier = ref.read(selfCareMyRoutineSelectedDaysProvider.notifier);
      /// 사용자의 모든 루틴을 검사
      for (int j = 0; j < routineAllMeState.routineList.length; j++) {
        /// 수정하려는 루틴은 제외
        if (j != widget.listIndex) {
          /// 수정하려는 루틴을 제외한 모든 루틴이 사용되는 요일을 저장
          selectedDaysNotifier.state += routineAllMeState.routineList[j].dayOfWeeks;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedDaysState = ref.watch(selfCareMyRoutineSelectedDaysProvider);
    final daysState = ref.watch(selfCareMyRoutineDaysProvider);
    final daysNotifier = ref.read(selfCareMyRoutineDaysProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PtdTextWidget.bodyMedium("요일", MaeumgagymColor.black),
        const SizedBox(height: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Row(
              children: [
                for (int i = 0; i < 7; i++)
                  GestureDetector(
                    onTap: () {
                      daysNotifier.changeDays(i, selectedDaysState);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: i == 6 ? 0 : 4),
                      child: Container(
                        decoration: BoxDecoration(
                          color: daysState.values.elementAt(i)
                              ? MaeumgagymColor.blue500
                              : MaeumgagymColor.gray50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 19, vertical: 12),
                          child: PtdTextWidget.bodyMedium(
                            daysState.keys.elementAt(i),
                            daysState.values.elementAt(i)
                                ? MaeumgagymColor.white
                                : MaeumgagymColor.black,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
