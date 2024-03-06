/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider
import '../provider/pose_part_selector_controller.dart';
import '../provider/pose_tab_controller.dart';

/// Screen
import '../widget/tab_body/tab_body_part_screen.dart';
import '../widget/tab_body/tab_body_recommend_screen.dart';

class PoseTabBody extends ConsumerWidget {
  final bool useNavigator;

  const PoseTabBody({super.key, required this.useNavigator});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<List<String>> tabNameList = [
      ['상체', '가슴'],
      ['상체', '등'],
      ['상체', '어깨'],
      ['상체', '팔'],
      ['상체', '복근'],
      ['하체', '앞 허벅지'],
      ['하체', '뒷 허벅지'],
      ['하체', '종아리'],
    ];

    /// Tab Contents
    return Expanded(
      child: IndexedStack(
        index: ref.watch(poseTabController).index,
        children: [
          /// 추천 운동 스크린
          const TabBodyRecommendScreen(),
          for (int i = 0; i < tabNameList.length; i++)

            /// 부위별 스크린
            TabBodyPartScreen(
              tabName: tabNameList[i],
              useNavigator: useNavigator,
            )
        ],
      ),
    );
  }
}
