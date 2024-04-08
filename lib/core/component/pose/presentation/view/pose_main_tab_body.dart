/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider
import '../provider/pose_tab_provider.dart';

/// Screen
import '../widget/tab_body/pose_main_tab_body_part_screen.dart';
import '../widget/tab_body/pose_main_tab_body_recommend_screen.dart';

class PoseMainTabBody extends ConsumerWidget {
  final List<String> tabBodyData;
  final bool useNavigator;

  const PoseMainTabBody({
    super.key,
    required this.useNavigator,
    required this.tabBodyData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Tab Contents
    return Expanded(
      child: PoseMainTabBodyPartScreen(
        tabName: tabBodyData[ref.watch(poseTabController)],
        useNavigator: useNavigator,
      ),
    );
  }
}
