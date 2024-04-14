import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../config/maeumgagym_color.dart';
import '../../../../../text/pretendard/ptd_text_widget.dart';
import '../../../provider/pose_part_selector_provider.dart';

class PosePartSelectorWidget extends ConsumerWidget {
  const PosePartSelectorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posePartState = ref.watch(posePartSelectorController);
    final posePartNotifier = ref.read(posePartSelectorController.notifier);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// 맨몸
          GestureDetector(
            onTap: () => posePartNotifier.clickCalisthenics(),
            child: Container(
              /// Tag가 선택시 blue500 아닐 시 gray50
              decoration: BoxDecoration(
                color: posePartState == PartSelectorState.calisthenics
                    ? MaeumgagymColor.blue500
                    : MaeumgagymColor.gray50,
                borderRadius: BorderRadius.circular(100),
              ),

              /// Tag이름
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: PtdTextWidget.labelMedium(
                  '맨몸',
                  posePartState == PartSelectorState.calisthenics
                      ? MaeumgagymColor.white
                      : MaeumgagymColor.gray600,
                ),
              ),
            ),
          ),

          /// SizedBox
          const SizedBox(width: 8),

          /// 기구
          GestureDetector(
            onTap: () => posePartNotifier.clickMachine(),
            child: Container(
              /// Tag가 선택시 blue500 아닐 시 gray50
              decoration: BoxDecoration(
                color: posePartState == PartSelectorState.machine
                    ? MaeumgagymColor.blue500
                    : MaeumgagymColor.gray50,
                borderRadius: BorderRadius.circular(100),
              ),

              /// Tag이름
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: PtdTextWidget.labelMedium(
                  '기구',
                  posePartState == PartSelectorState.machine
                      ? MaeumgagymColor.white
                      : MaeumgagymColor.gray600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
