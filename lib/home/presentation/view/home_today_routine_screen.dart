import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_today_routines_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/today_routine/home_today_routine_app_bar.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/today_routine/home_today_routine_button.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/today_routine/home_today_routine_list_widget.dart';

import '../../../core/component/image/image_widget.dart';

class HomeTodayRoutineScreen extends ConsumerWidget {
  final int routineListIndex;

  const HomeTodayRoutineScreen({super.key, required this.routineListIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayRoutine =
        ref.read(homeTodayRoutineController).routineList[routineListIndex];

    final routineDayOfWeek = todayRoutine.dayOfWeeks
        .toString()
        .substring(1, todayRoutine.dayOfWeeks.toString().length - 1);

    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const HomeTodayRoutineAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: ref.watch(homeTodayRoutineController).statusCode.when(
          data: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PtdTextWidget.titleLarge(
                            '오늘의 루틴', MaeumgagymColor.black),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: 180,
                          child: PtdTextWidget.bodyMedium(
                            "${todayRoutine.routineName!} | $routineDayOfWeek",
                            MaeumgagymColor.blue500,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 98,
                      height: 36,
                      decoration: BoxDecoration(
                        color: MaeumgagymColor.gray50,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PtdTextWidget.labelMedium(
                              todayRoutine.isCompleted! ? '완료' : '미완료',
                              todayRoutine.isCompleted!
                                  ? MaeumgagymColor.blue500
                                  : MaeumgagymColor.gray600,
                            ),
                            const SizedBox(width: 8),
                            ImageWidget(
                              image: todayRoutine.isCompleted!
                                  ? Images.iconsCheckCircle
                                  : Images.timeClock,
                              width: 16,
                              height: 16,
                              color: todayRoutine.isCompleted!
                                  ? MaeumgagymColor.blue500
                                  : MaeumgagymColor.gray600,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: todayRoutine.exerciseInfoResponseList!.length,
                    itemBuilder: (context, index) {
                      final poseData =
                          todayRoutine.exerciseInfoResponseList![index];
                      return HomeTodayRoutineListWidget(
                        poseData: poseData.pose,
                        repetitions: poseData.repetitions!,
                        sets: poseData.sets!,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 75)
              ],
            );
          },
          error: (err, _) {
            return Text(err.toString());
          },
          loading: () {
            return Center(
                child: CircularProgressIndicator(
              color: MaeumgagymColor.blue500,
            ));
          },
        ),
      ),
      bottomSheet: HomeTodayRoutineButton(
        isCompleted: todayRoutine.isCompleted!,
        routineId: todayRoutine.id!,
        routineList: todayRoutine.exerciseInfoResponseList!,
      ),
    );
  }
}
