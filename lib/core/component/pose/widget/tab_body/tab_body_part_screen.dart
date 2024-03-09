/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider
import '../../provider/pose_part_selector_provider.dart';

/// Widget
import 'package:maeum_ga_gym_flutter/core/component/pose/widget/tab_body/part/pose_part_selector.dart';
import '../../../../../pose/presentation/widget/pose_data.dart';
import 'part/pose_part_widget.dart';

class TabBodyPartScreen extends ConsumerWidget {
  final List<String> tabName;
  final bool useNavigator;

  const TabBodyPartScreen({
    required this.tabName,
    required this.useNavigator,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posePartState = ref.watch(posePartSelectorController);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          children: [
            /// 맨몸 기구 선택란
            // nonePosePartSelector ? const SizedBox() :
            const PosePartSelector(),

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
                  switch (posePartState) {
                    case PartSelectorState.calisthenics:
                      return data[index]["simplePart"] == "맨몸"
                          ? PosePartWidget(
                              index: index,
                              useNavigator: useNavigator,
                            )
                          : const SizedBox.shrink();
                    case PartSelectorState.machine:
                      return data[index]["simplePart"] == "기구"
                          ? PosePartWidget(
                              index: index,
                              useNavigator: useNavigator,
                            )
                          : const SizedBox.shrink();
                    default:
                      return PosePartWidget(
                        index: index,
                        useNavigator: useNavigator,
                      );
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
