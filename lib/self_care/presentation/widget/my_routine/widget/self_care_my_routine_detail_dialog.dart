import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_routine_item_provider.dart';

class SelfCareMyRoutineDetailDialog extends ConsumerWidget {
  final int index;

  const SelfCareMyRoutineDetailDialog({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routineItemNotifier = ref.watch(selfCareRoutineItemProvider.notifier);
    final isKeptState = ref.watch(selfCareRoutineItemProvider)[index].isKept;
    final isSharedState = ref.watch(selfCareRoutineItemProvider)[index].isShared;
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
                onTap: () {
                  if (isSharedState == true) {
                    routineItemNotifier.cancelShareRoutineItem(index);
                  } else {
                    routineItemNotifier.shareRoutineItem(index);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/image/self_care_icon/earth_icon.svg",
                      ),
                      const SizedBox(width: 12),
                      PtdTextWidget.bodyLarge(
                        isSharedState ? "공유 취소" : "공유",
                        MaeumgagymColor.black,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (isKeptState == true) {
                    routineItemNotifier.cancelKeepRoutineItem(index);
                  } else {
                    routineItemNotifier.keepRoutineItem(index);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/image/self_care_icon/inbox_icon.svg",
                      ),
                      const SizedBox(width: 12),
                      PtdTextWidget.bodyLarge(
                        isKeptState ? "보관 취소" : "보관",
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
