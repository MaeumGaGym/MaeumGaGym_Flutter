import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeumgagym_toast_message.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/add_routine_detail/pose_add_routine_detail_app_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/component/pose/domain/model/pose_data_model.dart';
import '../../../core/component/routine/presentation/provider/routine_my_routine_edit_routine_provider.dart';
import '../../../core/component/routine/presentation/provider/routine_my_routine_my_routine_provider.dart';
import '../../../core/component/routine/domain/model/exercise_info_edit_routine_pose_model.dart';
import '../../../core/component/routine/presentation/widget/routine_my_routine_item_count_widget.dart';
import '../../../home/presentation/providers/home_today_routines_provider.dart';
import '../../../self_care/domain/model/my_routine/exercise_info_request_model.dart';
import '../../../self_care/domain/model/my_routine/routine_response_model.dart';

class PoseAddRoutineDetailScreen extends ConsumerStatefulWidget {
  final int routineIndex;
  final String routineName;
  final String poseSimpleName, poseExactName;
  final PoseDataModel poseData;

  const PoseAddRoutineDetailScreen({
    super.key,
    required this.routineIndex,
    required this.routineName,
    required this.poseData,
    required this.poseSimpleName,
    required this.poseExactName,
  });

  @override
  ConsumerState<PoseAddRoutineDetailScreen> createState() =>
      _PoseAddRoutineDetailScreenState();
}

class _PoseAddRoutineDetailScreenState
    extends ConsumerState<PoseAddRoutineDetailScreen> {
  late final RoutineResponseModel item;
  late List<ExerciseInfoEditRoutinePoseModel> routineEditList;
  late final TextEditingController poseRepetitionsTextController;
  late final TextEditingController poseSetTextController;

  @override
  void dispose() {
    super.dispose();
    poseRepetitionsTextController.dispose();
    poseSetTextController.dispose();
  }

  @override
  void initState() {
    super.initState();
    poseRepetitionsTextController = TextEditingController(text: "10");
    poseSetTextController = TextEditingController(text: "1");

    /// 화면이 빌드되었을 때 init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      item =
          ref.watch(routineMyRoutinesProvider).routineList[widget.routineIndex];
      routineEditList = List<ExerciseInfoEditRoutinePoseModel>.generate(
        item.exerciseInfoResponseList.length,
        (index) => ExerciseInfoEditRoutinePoseModel(
          poseModel: PoseDataModel(
            id: item.exerciseInfoResponseList[index].pose!.id,
            thumbnail: item.exerciseInfoResponseList[index].pose!.thumbnail,
            name: item.exerciseInfoResponseList[index].pose!.name,
            needMachine: item.exerciseInfoResponseList[index].pose!.needMachine,
            simplePart: item.exerciseInfoResponseList[index].pose!.simplePart,
            exactPart: item.exerciseInfoResponseList[index].pose!.exactPart,
          ),
          repetitionsController: TextEditingController(
              text:
                  item.exerciseInfoResponseList[index].repetitions.toString()),
          setsController: TextEditingController(
              text: item.exerciseInfoResponseList[index].sets.toString()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final editPoseListNotifier =
        ref.read(routineMyRoutineEditRoutineProvider.notifier);

    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: PoseAddRoutineDetailAppBar(
        routineName: widget.routineName,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(
            imageType: ImageType.pngNetwork,
            image: widget.poseData.thumbnail!,
            backgroundColor: MaeumgagymColor.gray25,
            width: MediaQuery.of(context).size.width,
            height: 300,
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PtdTextWidget.titleMedium(
                  widget.poseSimpleName,
                  MaeumgagymColor.gray600,
                ),
                const SizedBox(height: 8),
                PtdTextWidget.titleLarge(
                  widget.poseExactName,
                  MaeumgagymColor.black,
                ),
                const SizedBox(height: 24),
                RoutineMyRoutineItemCountWidget(
                  title: "횟수",
                  controller: poseRepetitionsTextController,
                ),
                const SizedBox(height: 12),
                RoutineMyRoutineItemCountWidget(
                  title: "세트",
                  controller: poseSetTextController,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 98,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: MaeumgagymColor.white,
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 40) / 2 - 8,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: MaeumgagymColor.gray50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: PtdTextWidget.labelLarge("취소", MaeumgagymColor.black),
                ),
              ),
              Builder(
                builder: (context) {
                  if (ref
                          .watch(routineMyRoutineEditRoutineProvider)
                          .isLoading ||
                      ref
                          .watch(routineMyRoutinesProvider)
                          .statusCode
                          .isLoading) {
                    return Container(
                      alignment: Alignment.center,
                      width: (MediaQuery.of(context).size.width - 40) / 2 - 8,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: MaeumgagymColor.blue500,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CircularProgressIndicator(
                        color: MaeumgagymColor.white,
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () async {
                        routineEditList.add(
                          ExerciseInfoEditRoutinePoseModel(
                            poseModel: widget.poseData,
                            repetitionsController:
                                poseRepetitionsTextController,
                            setsController: poseSetTextController,
                          ),
                        );

                        await editPoseListNotifier.editRoutine(
                          routineName: widget.routineName,
                          isArchived: item.routineStatus!.isArchived!,
                          isShared: item.routineStatus!.isShared!,
                          exerciseInfoRequestList:
                              List<ExerciseInfoRequestModel>.generate(
                            routineEditList.length,
                            (index) => ExerciseInfoRequestModel(
                              id: routineEditList[index].poseModel!.id,

                              /// TextEditingController >> int
                              repetitions: int.parse(
                                routineEditList[index]
                                    .repetitionsController
                                    .text,
                              ),

                              /// TextEditingController >> int
                              sets: int.parse(
                                routineEditList[index].setsController.text,
                              ),
                            ),
                          ),
                          dayOfWeeks: item.dayOfWeeks,
                          routineId: item.id!,
                        );

                        await ref
                            .read(homeTodayRoutineController.notifier)
                            .getTodayRoutines();

                        if (context.mounted) {
                          showTopSnackBar(
                            Overlay.of(context),
                            MaeumGaGymToastMessage(
                              title: "${widget.routineName}에 루틴을 추가했어요.",
                            ),
                          );

                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width - 40) / 2 - 8,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: MaeumgagymColor.blue500,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: PtdTextWidget.labelLarge(
                            "완료", MaeumgagymColor.white),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
