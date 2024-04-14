/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/presentation/provider/pose_all_provider.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/presentation/widget/tab_body/part/pose_part_selector_widget.dart';

/// Provider
import '../../provider/pose_part_selector_provider.dart';

/// Widget
import 'part/pose_part_widget.dart';

class PoseMainTabBodyPartScreen extends ConsumerStatefulWidget {
  final String tabName;
  final bool useNavigator;

  const PoseMainTabBodyPartScreen({
    required this.tabName,
    required this.useNavigator,
    super.key,
  });

  @override
  ConsumerState<PoseMainTabBodyPartScreen> createState() =>
      _PoseMainTabBodyScreenState();
}

class _PoseMainTabBodyScreenState
    extends ConsumerState<PoseMainTabBodyPartScreen> {
  @override
  Widget build(BuildContext context) {
    final poseAll = ref.read(poseAllController);
    final posePartState = ref.watch(posePartSelectorController);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          children: [
            /// 맨몸 기구 선택란
            const PosePartSelectorWidget(),

            /// Part Data List
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: poseAll.length,
              itemBuilder: (context, index) {
                /// tabName으로 들어온 값이랑 exactPart가 맞지 않으면 SizedBox.shrink()
                if (!poseAll[index].simplePart.contains(widget.tabName)) {
                  return const SizedBox.shrink();
                } else {
                  switch (posePartState) {
                    case PartSelectorState.calisthenics:
                      return !poseAll[index].needMachine!
                          ? PosePartWidget(
                              data: poseAll[index],
                              useNavigator: widget.useNavigator,
                            )
                          : const SizedBox.shrink();
                    case PartSelectorState.machine:
                      return poseAll[index].needMachine!
                          ? PosePartWidget(
                              data: poseAll[index],
                              useNavigator: widget.useNavigator,
                            )
                          : const SizedBox.shrink();
                    case PartSelectorState.all:
                      return PosePartWidget(
                        data: poseAll[index],
                        useNavigator: widget.useNavigator,
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
