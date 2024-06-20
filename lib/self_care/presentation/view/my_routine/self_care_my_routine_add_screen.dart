import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeumgagym_toast_message.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_today_routines_provider.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/domain/model/exercise_info_edit_routine_pose_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/exercise_info_request_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_add_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_days_provider.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/provider/routine_my_routine_my_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_pose_list_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/my_routine/self_care_my_routine_pose_add_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/self_care_my_routine_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/self_care_my_routine_days_select_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/self_care_my_routine_pose_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_text_field.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SelfCareMyRoutineAddScreen extends ConsumerStatefulWidget {
  const SelfCareMyRoutineAddScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SelfCareMyRoutineAddScreen> createState() =>
      _SelfCareMyRoutineAddScreenState();
}

class _SelfCareMyRoutineAddScreenState
    extends ConsumerState<SelfCareMyRoutineAddScreen> {
  late TextEditingController titleController;
  late FocusNode titleNode;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    titleNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    List<ExerciseInfoEditRoutinePoseModel> addPoseListState =
        ref.watch(selfCareMyRoutinePostListProvider);

    final addRoutineNotifier =
        ref.read(selfCareMyRoutineAddRoutineProvider.notifier);
    final myRoutineNotifier = ref.read(routineMyRoutinesProvider.notifier);

    Map<String, bool> editRoutineDaysState =
        ref.watch(selfCareMyRoutineDaysProvider);

    ref.listen(selfCareMyRoutineAddRoutineProvider.select((value) => value),
        (previous, next) {
      if (next == const AsyncData<int?>(201)) {
        myRoutineNotifier.getMyRoutineInit();
        Navigator.of(context).pop();
        showTopSnackBar(
          Overlay.of(context),
          const MaeumGaGymToastMessage(title: "루틴을 추가했어요."),
        );
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: Images.arrowLeft,
        title: "루틴 추가",
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
                  hintText: "제목을 입력해주세요.",
                ),
                const SizedBox(height: 32),

                const SelfCareMyRoutineDaysSelectWidget(isAdd: true),

                const SizedBox(height: 32),

                /// item 리스트
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: addPoseListState.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SelfCareMyRoutinePoseItemWidget(
                          poseIndex: index,
                        ),

                        /// 마지막 item이라면 간격 x
                        SizedBox(
                            height:
                                index == addPoseListState.length - 1 ? 0 : 40),
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
                      imagePath: Images.editAdd,
                      imageHeight: 24,
                      imageWidth: 24,
                      buttonColor: MaeumgagymColor.gray50,
                      textColor: MaeumgagymColor.gray800,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      if (titleController.text.isNotEmpty &&
                          addPoseListState.isNotEmpty) {
                        await addRoutineNotifier.addRoutine(
                          routineName: titleController.text,
                          isArchived: false,
                          isShared: false,
                          exerciseInfoRequestList:
                              List<ExerciseInfoRequestModel>.generate(
                            addPoseListState.length,
                            (index) => ExerciseInfoRequestModel(
                              id: addPoseListState[index].poseModel!.id,

                              /// TextEditingController >> int
                              repetitions: int.parse(
                                addPoseListState[index]
                                    .repetitionsController
                                    .text,
                              ),

                              /// TextEditingController >> int
                              sets: int.parse(
                                addPoseListState[index].setsController.text,
                              ),
                            ),
                          ),
                          dayOfWeeks: editRoutineDaysState.entries
                              .where((entry) => entry.value)
                              .map((entry) => entry.key)
                              .toList(),

                          /// entry.value 값이 true (참) 이라면 key 값으로 List 생성
                        );

                        await ref
                            .read(homeTodayRoutineController.notifier)
                            .getTodayRoutines();
                      }
                    },
                    child: SelfCareMyRoutineButton(
                      width: MediaQuery.of(context).size.width,
                      height: 58,
                      title: "완료",
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
