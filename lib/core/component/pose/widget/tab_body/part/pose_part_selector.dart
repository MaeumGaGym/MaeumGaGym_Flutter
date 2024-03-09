import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/widget/tab_body/part/pose_part_selector_widget.dart';

import '../../../provider/pose_part_selector_provider.dart';

class PosePartSelector extends ConsumerWidget {
  const PosePartSelector({super.key});

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
            child: PosePartSelectorWidget(
              title: '맨몸',
              state: posePartState == PartSelectorState.calisthenics,
            ),
          ),

          /// SizedBox
          const SizedBox(width: 8),

          /// 기구
          GestureDetector(
            onTap: () => posePartNotifier.clickMachine(),
            child: PosePartSelectorWidget(
              title: '기구',
              state: posePartState == PartSelectorState.machine,
            ),
          ),
        ],
      ),
    );
  }
}
