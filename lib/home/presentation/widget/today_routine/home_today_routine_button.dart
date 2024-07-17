import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/routine_start/presentation/provider/routine_start_page_view_provider.dart';
import 'package:maeum_ga_gym_flutter/routine_start/presentation/view/routine_start_main_screen.dart';

import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';
import '../../../../core/model/routine/maeumgagym_routine_list_model.dart';

class HomeTodayRoutineButton extends ConsumerWidget {
  final int routineId;
  final bool isCompleted;
  final List<ExerciseInfoList> routineList;

  const HomeTodayRoutineButton({
    super.key,
    required this.isCompleted,
    required this.routineId,
    required this.routineList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 98,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: MaeumgagymColor.white,
        border: Border.all(color: MaeumgagymColor.gray50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Builder(
          builder: (context) {
            if (isCompleted) {
              return Container(
                decoration: BoxDecoration(
                  color: MaeumgagymColor.gray100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: PtdTextWidget.labelLarge(
                    "루틴 완료함",
                    MaeumgagymColor.gray300,
                  ),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RoutineStartMainScreen(
                        routineId: routineId,
                        routineList: routineList
                      ),
                    ),
                  );

                  ref.read(routineStartPageViewProvider.notifier).state = 0;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: MaeumgagymColor.blue500,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageWidget(
                          width: 24,
                          image: Images.mediaPlayFilled,
                          color: MaeumgagymColor.white,
                        ),
                        const SizedBox(width: 8),
                        PtdTextWidget.labelLarge("루틴 시작하기", MaeumgagymColor.white)
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
