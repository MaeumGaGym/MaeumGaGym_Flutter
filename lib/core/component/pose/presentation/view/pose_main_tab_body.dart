/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider
import '../provider/pose_tab_provider.dart';

/// Screen
import '../widget/tab_body/pose_main_tab_body_part_screen.dart';
import '../widget/tab_body/pose_main_tab_body_recommend_screen.dart';

class PoseMainTabBody extends ConsumerWidget {
  final List<List<String>> tabBodyData;
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
      child: IndexedStack(
        index: ref.watch(poseTabController),
        children: [
          /// 추천 운동 스크린
          const PoseMainTabBodyRecommendScreen(),

          /// 부위별 스크린
          for (int i = 0; i < tabBodyData.length; i++)
            PoseMainTabBodyPartScreen(
              tabName: tabBodyData[i],
              useNavigator: useNavigator,
            )
        ],
      ),
    );
  }
}
