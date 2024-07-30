import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_days_provider.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/provider/routine_my_routine_my_routine_provider.dart';

class SelfCareMyRoutineDaysSelectWidget extends ConsumerStatefulWidget {
  final bool isAdd;
  final int? listIndex;

  const SelfCareMyRoutineDaysSelectWidget({
    super.key,
    required this.isAdd,
    this.listIndex,
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
    if (widget.isAdd == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final myRoutineState = ref.watch(routineMyRoutinesProvider);
        ref
            .read(selfCareMyRoutineDaysProvider.notifier)
            .init(myRoutineState.routineList[widget.listIndex!].dayOfWeeks);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      daysNotifier.changeDays(i);
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
