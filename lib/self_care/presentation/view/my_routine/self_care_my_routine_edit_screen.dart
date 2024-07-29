import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeumgagym_toast_message.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_today_routines_provider.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/domain/model/exercise_info_edit_routine_pose_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/exercise_info_request_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/provider/routine_my_routine_my_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_days_provider.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/provider/routine_my_routine_edit_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_pose_list_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/my_routine/self_care_my_routine_pose_add_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/self_care_my_routine_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/self_care_my_routine_days_select_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/self_care_my_routine_pose_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_text_field.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/component/maeumgagym_toast_error_message.dart';

class SelfCareMyRoutineEditScreen extends ConsumerStatefulWidget {
  final int listIndex;
  final String routineName;

  const SelfCareMyRoutineEditScreen({
    Key? key,
    required this.listIndex,
    required this.routineName,
  }) : super(key: key);

  @override
  ConsumerState<SelfCareMyRoutineEditScreen> createState() =>
      _SelfCareMyRoutineEditScreenState();
}

class _SelfCareMyRoutineEditScreenState
    extends ConsumerState<SelfCareMyRoutineEditScreen> {
  late TextEditingController titleController;
  late FocusNode titleNode;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.routineName);
    titleNode = FocusNode();
    titleNode.unfocus();

    /// 화면이 빌드되었을 때 init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final myRoutineState = ref.watch(routineMyRoutinesProvider);
      final item = myRoutineState.routineList[widget.listIndex];
      ref.read(selfCareMyRoutinePostListProvider.notifier).init(
            List<ExerciseInfoEditRoutinePoseModel>.generate(
              item.exerciseInfoResponseList.length,
              (index) => ExerciseInfoEditRoutinePoseModel(
                poseModel: PoseDataModel(
                  id: item.exerciseInfoResponseList[index].pose.id,
                  thumbnail:
                      item.exerciseInfoResponseList[index].pose.thumbnail,
                  name: item.exerciseInfoResponseList[index].pose.name,
                  needMachine:
                      item.exerciseInfoResponseList[index].pose.needMachine,
                  simplePart:
                      item.exerciseInfoResponseList[index].pose.simplePart,
                  exactPart:
                      item.exerciseInfoResponseList[index].pose.exactPart,
                ),
                repetitionsController: TextEditingController(
                    text: item.exerciseInfoResponseList[index].repetitions
                        .toString()),
                setsController: TextEditingController(
                    text: item.exerciseInfoResponseList[index].sets.toString()),
              ),
            ),
          );
    });
  }

  @override
  void dispose() {
    super.dispose();
    titleNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ExerciseInfoEditRoutinePoseModel> editPoseListState =
        ref.watch(selfCareMyRoutinePostListProvider);

    final editPoseListNotifier =
        ref.read(routineMyRoutineEditRoutineProvider.notifier);

    Map<String, bool> editRoutineDaysState =
        ref.watch(selfCareMyRoutineDaysProvider);

    final myRoutineState = ref.watch(routineMyRoutinesProvider);
    final myRoutineNotifier = ref.read(routineMyRoutinesProvider.notifier);
    final item = myRoutineState.routineList[widget.listIndex];
    ref.listen(routineMyRoutineEditRoutineProvider.select((value) => value),
        (previous, next) {
      if (next == const AsyncData<int?>(200)) {
        myRoutineNotifier.getMyRoutineInit();
        Navigator.of(context).pop();
        showTopSnackBar(
          Overlay.of(context),
          const MaeumGaGymToastMessage(title: "루틴을 수정했어요."),
        );
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MaeumgagymColor.white,
      appBar: SelfCareDefaultAppBar(
        iconPath: Images.arrowLeft,
        title: widget.routineName,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                /// 제목 입력 text field
                SelfCareTextField(
                  title: "제목",
                  focusNode: titleNode,
                  controller: titleController,
                  inputAction: TextInputAction.done,
                  maxLengths: 12,
                  hintText: "제목을 입력해주세요.",
                ),
                const SizedBox(height: 32),

                SelfCareMyRoutineDaysSelectWidget(
                    isAdd: false, listIndex: widget.listIndex),

                const SizedBox(height: 32),

                /// item 리스트
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: editPoseListState.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SelfCareMyRoutinePoseItemWidget(
                          listIndex: widget.listIndex,
                          poseIndex: index,
                        ),

                        /// 마지막 item이라면 간격 x
                        SizedBox(
                          height:
                              index == editPoseListState.length - 1 ? 0 : 40,
                        ),
                      ],
                    );
                  },
                ),

                /// 디자인 보고 간격 넣었습니다.
                /// 안 넣으니깐 아이템이 밑에 씹히더라구용
                const SizedBox(height: 98),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: MaeumgagymColor.white,

          /// 디자인보면 위쪽에 색있음
          border: Border(
            top: BorderSide(
              color: MaeumgagymColor.gray50,
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const SelfCareMyRoutinePoseAddScreen(),
                      ),
                    ),
                    child: SelfCareMyRoutineButton(
                      width: MediaQuery.of(context).size.width,
                      height: 58,
                      title: "자세 추가",
                      imageHeight: 24,
                      imageWidth: 24,
                      imagePath: Images.editAdd,
                      buttonColor: MaeumgagymColor.gray50,
                      textColor: MaeumgagymColor.gray800,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      if(titleController.text.isNotEmpty && ref.read(selfCareMyRoutineDaysProvider.notifier).daysHaveTrue() && editPoseListState.isNotEmpty){
                        await editPoseListNotifier.editRoutine(
                          routineName: titleController.text,
                          isArchived: item.routineStatus.isArchived,
                          isShared: item.routineStatus.isShared,
                          exerciseInfoRequestList:
                          List<ExerciseInfoRequestModel>.generate(
                            editPoseListState.length,
                                (index) => ExerciseInfoRequestModel(
                              id: editPoseListState[index].poseModel!.id,

                              /// TextEditingController >> int
                              repetitions: int.parse(
                                editPoseListState[index]
                                    .repetitionsController
                                    .text,
                              ),

                              /// TextEditingController >> int
                              sets: int.parse(
                                editPoseListState[index].setsController.text,
                              ),
                            ),
                          ),
                          dayOfWeeks: editRoutineDaysState.entries
                              .where((entry) => entry.value)
                              .map((entry) => entry.key)
                              .toList(),
                          routineId: item.id,
                        );

                        await ref
                            .read(homeTodayRoutineController.notifier)
                            .getTodayRoutines();
                      } else {
                        showTopSnackBar(
                          Overlay.of(context),
                          const MaeumGaGymToastErrorMessage(title: "루틴을 수정할 수 없어요"),
                        );
                      }
                    },
                    child: SelfCareMyRoutineButton(
                      width: MediaQuery.of(context).size.width,
                      height: 58,
                      title: "수정하기",
                      buttonColor: MaeumgagymColor.blue500,
                      textColor: MaeumgagymColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
