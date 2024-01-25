import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_routine_item_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/my_routine/self_care_my_routine_edit_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_manage_item_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_toast_message.dart';

class SelfCareMyRoutineManageBottomSheet extends ConsumerStatefulWidget {
  final int index;

  const SelfCareMyRoutineManageBottomSheet({
    Key? key,
    required this.index,
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
      child: SelfCareMyRoutineToastMessage(title: title),
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(milliseconds: 1600),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final routineItemNotifier = ref.watch(selfCareRoutineItemProvider.notifier);
    final isKeptState =
        ref.watch(selfCareRoutineItemProvider)[widget.index].isKept;
    final isSharedState =
        ref.watch(selfCareRoutineItemProvider)[widget.index].isShared;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
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
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelfCareMyRoutineEditScreen(),
                  ),
                ),
                child: const SelfCareDefaultManageItemWidget(
                  title: "수정",
                  iconPath: "assets/image/self_care_icon/edit_pencil_icon.svg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (isKeptState == true) {
                    routineItemNotifier.cancelKeepRoutineItem(widget.index);
                    _showToast("루틴 보관을 취소했어요.");
                  } else {
                    routineItemNotifier.keepRoutineItem(widget.index);
                    _showToast("루틴을 보관했어요.");
                  }
                },
                child: SelfCareDefaultManageItemWidget(
                  title: isKeptState ? "보관 취소" : "보관",
                  iconPath: "assets/image/self_care_icon/inbox_icon.svg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (isSharedState == true) {
                    routineItemNotifier.cancelShareRoutineItem(widget.index);
                    _showToast("루틴 공유를 취소했어요.");
                  } else {
                    routineItemNotifier.shareRoutineItem(widget.index);
                    _showToast("루틴을 공유했어요.");
                  }
                },
                child: SelfCareDefaultManageItemWidget(
                  title: isSharedState ? "공유 취소" : "공유",
                  iconPath: "assets/image/self_care_icon/earth_icon.svg",
                ),
              ),
              const SelfCareDefaultManageItemWidget(
                title: "삭제",
                iconPath: "assets/image/self_care_icon/edit_trash_icon.svg",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
