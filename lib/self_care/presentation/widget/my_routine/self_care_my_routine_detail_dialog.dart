import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeumgagym_toast_message.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/exercise_info_request_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/provider/routine_my_routine_my_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/provider/routine_my_routine_edit_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_delete_routine_provider.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../home/presentation/providers/home_today_routines_provider.dart';
import '../../view/my_routine/self_care_my_routine_edit_screen.dart';

class SelfCareMyRoutineDetailDialog extends ConsumerStatefulWidget {
  final int listIndex;

  const SelfCareMyRoutineDetailDialog({
    super.key,
    required this.listIndex,
  });

  @override
  ConsumerState<SelfCareMyRoutineDetailDialog> createState() =>
      _SelfCareMyRoutineDetailDialogState();
}

class _SelfCareMyRoutineDetailDialogState
    extends ConsumerState<SelfCareMyRoutineDetailDialog> {
  void _showToast({required String message}) {
    showTopSnackBar(
      Overlay.of(context),
      MaeumGaGymToastMessage(title: message),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> updateState({
      bool? changeArchived,
      bool? changeShared,
    }) async {
      final myRoutineState = ref.watch(routineMyRoutinesProvider);
      final editRoutineNotifier = ref.read(routineMyRoutineEditRoutineProvider.notifier);
      final item = myRoutineState.routineList[widget.listIndex];

      List<ExerciseInfoRequestModel> exerciseListModel =
        item.exerciseInfoResponseList.map((e) => ExerciseInfoRequestModel(id: e.pose.id, repetitions: e.repetitions, sets: e.sets)).toList();

      await editRoutineNotifier.editRoutine(
        routineName: item.routineName.toString(),
        isArchived: changeArchived ?? item.routineStatus.isArchived,
        isShared: changeShared ?? item.routineStatus.isShared,
        exerciseInfoRequestList: exerciseListModel,
        routineId: item.id,
        dayOfWeeks: item.dayOfWeeks,
      );
    }

    final deleteRoutineNotifier = ref.read(selfCareMyRoutineDeleteRoutineProvider.notifier);
    final myRoutineState = ref.watch(routineMyRoutinesProvider);
    final item = myRoutineState.routineList[widget.listIndex];

    ref.listen(routineMyRoutineEditRoutineProvider.select((value) => value),
        (previous, next) {
      if (next == const AsyncData<int?>(200)) {
        Navigator.of(context).pop();
        ref.read(routineMyRoutinesProvider.notifier).getMyRoutineInit();
      }
    });
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: MaeumgagymColor.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PtdTextWidget.titleMedium(
                "루틴 설정",
                MaeumgagymColor.black,
              ),
              const SizedBox(height: 12),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SelfCareMyRoutineEditScreen(
                          listIndex: widget.listIndex,
                          routineName: item.routineName.toString(),
                        );
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      ImageWidget(
                        image: Images.editPencil,
                        color: MaeumgagymColor.black,
                        imageHeight: 24,
                        imageWidth: 24,
                      ),
                      const SizedBox(width: 12),
                      PtdTextWidget.bodyLarge(
                        "수정",
                        MaeumgagymColor.black,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (item.routineStatus.isShared) {
                    updateState(changeShared: false);
                    _showToast(message: "루틴 공유를 취소했어요.");
                  } else {
                    updateState(changeShared: true);
                    _showToast(message: "루틴을 공유했어요.");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      ImageWidget(
                        image: Images.iconsEarth,
                        color: MaeumgagymColor.black,
                        imageHeight: 24,
                        imageWidth: 24,
                      ),
                      const SizedBox(width: 12),
                      PtdTextWidget.bodyLarge(
                        item.routineStatus.isShared ? "공유 취소" : "공유",
                        MaeumgagymColor.black,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (item.routineStatus.isArchived) {
                    updateState(changeArchived: false);
                    _showToast(message: "루틴 보관을 취소했어요.");
                  } else {
                    updateState(changeArchived: true);
                    _showToast(message: "루틴을 보관했어요.");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      ImageWidget(
                        image: Images.iconsInbox,
                        color: MaeumgagymColor.black,
                        imageHeight: 24,
                        imageWidth: 24,
                      ),
                      const SizedBox(width: 12),
                      PtdTextWidget.bodyLarge(
                        !item.routineStatus.isArchived ? "보관" : "보관 취소",
                        MaeumgagymColor.black,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  Navigator.pop(context);

                  await deleteRoutineNotifier.deleteRoutine(routineId: item.id);
                  await ref
                      .read(homeTodayRoutineController.notifier)
                      .getTodayRoutines();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      ImageWidget(
                        image: Images.editTrash,
                        color: MaeumgagymColor.black,
                        imageHeight: 24,
                        imageWidth: 24,
                      ),
                      const SizedBox(width: 12),
                      PtdTextWidget.bodyLarge(
                        "삭제",
                        MaeumgagymColor.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
