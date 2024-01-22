import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/part/pose_part_selector_widget.dart';

import '../../provider/pose_part_controller.dart';

class PosePartSelector extends ConsumerWidget {
  const PosePartSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posePartState = ref.watch(posePartController);
    final posePartNotifier = ref.read(posePartController.notifier);

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
              state: posePartState.calisthenics,
            ),
          ),

          /// SizedBox
          const SizedBox(width: 8),

          /// 기구
          GestureDetector(
            onTap: () => posePartNotifier.clickMachine(),
            child: PosePartSelectorWidget(
              title: '기구',
              state: posePartState.machine,
            ),
          ),
        ],
      ),
    );
  }
}
