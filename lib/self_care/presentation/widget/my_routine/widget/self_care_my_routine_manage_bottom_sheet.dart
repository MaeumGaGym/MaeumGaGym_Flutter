import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_routine_item_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/my_routine/widget/self_care_my_routine_manage_item_widget.dart';

class SelfCareMyRoutineManageBottomSheet extends ConsumerWidget {
  final int index;

  const SelfCareMyRoutineManageBottomSheet({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routineItemNotifier = ref.watch(selfCareRoutineItemProvider.notifier);
    final isKeptState = ref.watch(selfCareRoutineItemProvider)[index].isKept;
    final isSharedState = ref.watch(selfCareRoutineItemProvider)[index].isShared;
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
              SelfCareMyRoutineManageItemWidget(
                title: "수정",
                iconPath: "assets/image/self_care_icon/edit_pencil_icon.svg",
              ),
              GestureDetector(
                onTap: () {
                  if (isKeptState == true) {
                    routineItemNotifier.cancelKeepRoutineItem(index);
                  } else {
                    routineItemNotifier.keepRoutineItem(index);
                  }
                },
                child: SelfCareMyRoutineManageItemWidget(
                  title: isKeptState ? "보관 취소" : "보관",
                  iconPath: "assets/image/self_care_icon/inbox_icon.svg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (isSharedState == true) {
                    routineItemNotifier.cancelShareRoutineItem(index);
                  } else {
                    routineItemNotifier.shareRoutineItem(index);
                  }
                },
                child: SelfCareMyRoutineManageItemWidget(
                  title: isSharedState ? "공유 취소" : "공유",
                  iconPath: "assets/image/self_care_icon/earth_icon.svg",
                ),
              ),
              SelfCareMyRoutineManageItemWidget(
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
