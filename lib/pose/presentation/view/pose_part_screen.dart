/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Widget
import '../provider/pose_part_controller.dart';
import '../widget/pose_data.dart';
import '../widget/pose_part_selector.dart';
import '../widget/pose_part_widget.dart';

class PosePartScreen extends ConsumerWidget {
  final List<String> tabName;
  final TabController tabContoller;

  const PosePartScreen({
    required this.tabContoller,
    required this.tabName,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posePartState = ref.watch(posePartController);
    final posePartNotifier = ref.read(posePartController.notifier);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          children: [
            /// 맨몸 기구 선택란
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// 맨몸
                  GestureDetector(
                    onTap: () => posePartNotifier.clickCalisthenics(),
                    child: PosePartSelector(
                      title: '맨몸',
                      state: posePartState.calisthenics,
                    ),
                  ),

                  /// SizedBox
                  const SizedBox(width: 8),

                  /// 기구
                  GestureDetector(
                    onTap: () => posePartNotifier.clickMachine(),
                    child: PosePartSelector(
                      title: '기구',
                      state: posePartState.machine,
                    ),
                  ),
                ],
              ),
            ),

            /// Part Data List
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (!(tabName.contains(data[index]['exactPart']))) {
                  return const SizedBox.shrink();
                } else {
                  if (posePartState.calisthenics) {
                    return data[index]["simplePart"] == "맨몸"
                        ? PosePartWidget(index: index)
                        : const SizedBox.shrink();
                  } else if (posePartState.machine) {
                    return data[index]["simplePart"] == "기구"
                        ? PosePartWidget(index: index)
                        : const SizedBox.shrink();
                  } else {
                    return PosePartWidget(index: index);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
