import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/my_routine/exercise_info_request_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_all_me_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_delete_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_edit_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/my_routine/self_care_my_routine_edit_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_manage_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_toast_message.dart';

class SelfCareMyRoutineManageBottomSheet extends ConsumerStatefulWidget {
  final int listIndex;

  const SelfCareMyRoutineManageBottomSheet({
    Key? key,
    required this.listIndex,
  }) : super(key: key);

  @override
  ConsumerState<SelfCareMyRoutineManageBottomSheet> createState() =>
      _SelfCareMyRoutineManageBottomSheetState();
}

class _SelfCareMyRoutineManageBottomSheetState
    extends ConsumerState<SelfCareMyRoutineManageBottomSheet> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  void _showToast(String title) {
    fToast.showToast(
      child: SelfCareDefaultToastMessage(title: title),
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(milliseconds: 1600),
    );
    Navigator.of(context).pop();
  }

  Future<void> _updateState({
    bool? changeArchived,
    bool? changeShared,
  }) async {
    final routineAllMeState = ref.watch(selfCareMyRoutineAllMeRoutineProvider);
    final editRoutineNotifier =
        ref.read(selfCareMyRoutineEditRoutineProvider.notifier);
    final routineAllMeNotifier =
        ref.read(selfCareMyRoutineAllMeRoutineProvider.notifier);
    final item = routineAllMeState.routineList[widget.listIndex];

    await editRoutineNotifier.editRoutine(
      routineName: item.routineName.toString(),
      isArchived: changeArchived ?? item.routineStatus!.isArchived!,
      isShared: changeShared ?? item.routineStatus!.isShared!,
      exerciseInfoRequestList: List<ExerciseInfoRequestModel>.generate(
        item.exerciseInfoResponseList.length,
        (index) => ExerciseInfoRequestModel(
          repetitions: item.exerciseInfoResponseList[index].repetitions,
          sets: item.exerciseInfoResponseList[index].sets,
          id: item.exerciseInfoResponseList[index].pose!.id,
        ),
      ),
      routineId: item.id!,
      dayOfWeeks: item.dayOfWeeks,
    )
        .whenComplete(() async {
      await routineAllMeNotifier.getRoutineAllMe();
    });
  }

  @override
  Widget build(BuildContext context) {
    final routineAllMeState = ref.watch(selfCareMyRoutineAllMeRoutineProvider);
    final routineAllMeNotifier = ref.read(selfCareMyRoutineAllMeRoutineProvider.notifier);
    final item = routineAllMeState.routineList[widget.listIndex];
    final deleteRoutineNotifier = ref.read(selfCareMyRoutineDeleteRoutineProvider.notifier);
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MaeumgagymColor.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),

          /// 맨 위 회색 바
          Container(
            width: 64,
            height: 5,
            decoration: BoxDecoration(
              color: MaeumgagymColor.gray300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelfCareMyRoutineEditScreen(
                      listIndex: widget.listIndex,
                      routineName: item.routineName.toString(),
                    ),
                  ),
                ),
                child: const SelfCareDefaultManageItemWidget(
                  title: "수정",
                  iconPath: "assets/image/self_care_icon/edit_pencil_icon.svg",
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  if (item.routineStatus!.isArchived == true) {
                    _updateState(changeArchived: false);
                    _showToast("루틴 보관을 취소했어요.");
                  } else {
                    _updateState(changeArchived: true);
                    _showToast("루틴을 보관했어요.");
                  }
                },
                child: SelfCareDefaultManageItemWidget(
                  title: item.routineStatus!.isArchived! ? "보관 취소" : "보관",
                  iconPath: "assets/image/self_care_icon/inbox_icon.svg",
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (item.routineStatus!.isShared == true) {
                    _updateState(changeShared: false);
                    _showToast("루틴 공유를 취소했어요.");
                  } else {
                    _updateState(changeShared: true);
                    _showToast("루틴을 공유했어요.");
                  }
                },
                child: SelfCareDefaultManageItemWidget(
                  title: item.routineStatus!.isShared! ? "공유 취소" : "공유",
                  iconPath: "assets/image/self_care_icon/earth_icon.svg",
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  deleteRoutineNotifier.deleteRoutine(routineId: item.id!).whenComplete(() {
                    _showToast("루틴을 삭제했어요.");
                    routineAllMeNotifier.getRoutineAllMe();
                  });
                },
                child: SelfCareDefaultManageItemWidget(
                  title: "삭제",
                  iconPath: "assets/image/self_care_icon/edit_trash_icon.svg",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
