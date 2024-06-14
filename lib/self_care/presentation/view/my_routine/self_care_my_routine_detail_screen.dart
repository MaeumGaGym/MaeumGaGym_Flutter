import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeumgagym_toast_message.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/home_today_routines_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_my_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_delete_routine_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/my_routine/self_care_my_routine_edit_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/self_care_my_routine_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/self_care_my_routine_detail_dialog.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/self_care_my_routine_detail_routine_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/self_care_my_routine_detail_title_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SelfCareMyRoutineDetailScreen extends ConsumerStatefulWidget {
  final int listIndex;

  const SelfCareMyRoutineDetailScreen({
    super.key,
    required this.listIndex,
  });

  @override
  ConsumerState<SelfCareMyRoutineDetailScreen> createState() =>
      _SelfCareMyRoutineDetailScreenState();
}

class _SelfCareMyRoutineDetailScreenState
    extends ConsumerState<SelfCareMyRoutineDetailScreen> {
  void _showToast({required String message}) {
    showTopSnackBar(
      Overlay.of(context),
      MaeumGaGymToastMessage(title: message),
    );
  }

  @override
  Widget build(BuildContext context) {
    final myRoutineState = ref.watch(selfCareMyRoutineMyRoutinesProvider);
    final myRoutineNotifier =
        ref.read(selfCareMyRoutineMyRoutinesProvider.notifier);
    final deleteRoutineNotifier =
        ref.read(selfCareMyRoutineDeleteRoutineProvider.notifier);
    final item = myRoutineState.routineList[widget.listIndex];
    ref.listen(selfCareMyRoutineDeleteRoutineProvider.select((value) => value), (previous, next) {
      if (next == const AsyncData<int?>(204)) {
        myRoutineNotifier.getMyRoutineInit();
        Navigator.of(context).pop();
        _showToast(message: "루틴을 삭제했어요.");
      }
    });
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 루틴 아이템을 식별하기 위한 index
                SelfCareMyRoutineDetailTitleWidget(listIndex: widget.listIndex),
                const SizedBox(height: 32),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: item.exerciseInfoResponseList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SelfCareMyRoutineDetailRoutineItemWidget(
                          routineListIndex: widget.listIndex,
                          exerciseInfoListIndex: index,
                        ),

                        /// 마지막 아이템일 경우 간격 x
                        SizedBox(
                          height:
                              index == item.exerciseInfoResponseList.length - 1
                                  ? 0
                                  : 12,
                        ),
                      ],
                    );
                  },
                ),
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
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      await deleteRoutineNotifier.deleteRoutine(routineId: item.id!);
                      await ref.read(homeTodayRoutineController.notifier).getTodayRoutines();
                    },
                    child: SelfCareMyRoutineButton(
                      width: MediaQuery.of(context).size.width,
                      height: 58,
                      title: "루틴 삭제",
                      imagePath:
                          "assets/image/self_care_icon/edit_trash_icon.svg",
                      buttonColor: MaeumgagymColor.gray50,
                      textColor: MaeumgagymColor.gray800,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SelfCareMyRoutineEditScreen(
                            listIndex: widget.listIndex,
                            routineName: item.routineName.toString(),
                          );
                        },
                      ),
                    ),
                    child: SelfCareMyRoutineButton(
                      width: MediaQuery.of(context).size.width,
                      height: 58,
                      title: "루틴 수정",
                      imagePath:
                          "assets/image/self_care_icon/edit_pencil_icon.svg",
                      imageColor: MaeumgagymColor.white,
                      buttonColor: MaeumgagymColor.blue500,
                      textColor: MaeumgagymColor.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return SelfCareMyRoutineDetailDialog(
                          listIndex: widget.listIndex,
                        );
                      },
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/image/core_icon/dots_vertical_icon.svg",
                    width: 32,
                    height: 32,
                    color: MaeumgagymColor.black,
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
