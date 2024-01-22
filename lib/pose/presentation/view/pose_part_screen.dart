/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/part/pose_part_selector.dart';

/// Widget
import '../provider/pose_part_controller.dart';
import '../widget/pose_data.dart';
import '../widget/part/pose_part_widget.dart';

class PosePartScreen extends ConsumerWidget {
  final bool nonePosePartSelector;
  final List<String> tabName;

  const PosePartScreen({
    required this.tabName,
    required this.nonePosePartSelector,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posePartState = ref.watch(posePartController);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          children: [
            /// 맨몸 기구 선택란
            nonePosePartSelector ? const SizedBox() : const PosePartSelector(),

            /// Part Data List
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                /// tabName으로 들어온 값이랑 exactPart가 맞지 않으면 SizedBox.shrink()
                if (!(tabName.contains(data[index]['exactPart']))) {
                  return const SizedBox.shrink();
                } else {
                  if (posePartState.calisthenics) {
                    /// 맨몸 태그를 눌렀을때
                    return data[index]["simplePart"] == "맨몸"
                        ? PosePartWidget(index: index)
                        : const SizedBox.shrink();

                    /// 기구 태그를 눌렀을때
                  } else if (posePartState.machine) {
                    return data[index]["simplePart"] == "기구"
                        ? PosePartWidget(index: index)
                        : const SizedBox.shrink();
                  } else {
                    /// 태그를 둘다 누르지 않았을 때
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
