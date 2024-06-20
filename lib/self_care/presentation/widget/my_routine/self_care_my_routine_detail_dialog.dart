import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeumgagym_toast_message.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/exercise_info_request_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/provider/routine_my_routine_my_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/provider/routine_my_routine_edit_routine_provider.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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

  Future<void> _updateState({
    bool? changeArchived,
    bool? changeShared,
  }) async {
    final myRoutineState = ref.watch(routineMyRoutinesProvider);
    final editRoutineNotifier =
        ref.read(routineMyRoutineEditRoutineProvider.notifier);
    final item = myRoutineState.routineList[widget.listIndex];

    await editRoutineNotifier.editRoutine(
      routineName: item.routineName.toString(),
      isArchived: changeArchived ?? item.routineStatus!.isArchived!,
      isShared: changeShared ?? item.routineStatus!.isShared!,
      exerciseInfoRequestList: List<ExerciseInfoRequestModel>.filled(
        item.exerciseInfoResponseList.length,
        ExerciseInfoRequestModel(
          repetitions:
              item.exerciseInfoResponseList[widget.listIndex].repetitions,
          sets: item.exerciseInfoResponseList[widget.listIndex].sets,
          id: item.exerciseInfoResponseList[widget.listIndex].pose!.id,
        ),
      ),
      routineId: item.id!,
      dayOfWeeks: item.dayOfWeeks,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  if (item.routineStatus!.isShared == true) {
                    _updateState(changeShared: false);
                    _showToast(message: "루틴 공유를 취소했어요.");
                  } else {
                    _updateState(changeShared: true);
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
                        item.routineStatus!.isShared! ? "공유 취소" : "공유",
                        MaeumgagymColor.black,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (item.routineStatus!.isArchived == true) {
                    _updateState(changeArchived: false);
                    _showToast(message: "루틴 보관을 취소했어요.");
                  } else {
                    _updateState(changeArchived: true);
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
                        !item.routineStatus!.isArchived! ? "보관 취소" : "보관",
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
