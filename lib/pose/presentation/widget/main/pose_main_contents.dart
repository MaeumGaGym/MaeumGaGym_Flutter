/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/component/pose/presentation/view/pose_main_tab_bar.dart';
import '../../../../core/component/pose/presentation/view/pose_main_tab_body.dart';

/// 자세(글씨)까지를 제외한 고정되는 Pose Contents들
class PoseMainTabContents extends ConsumerWidget {
  const PoseMainTabContents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// TabBar 글씨를 나타낸 List
    final List<String> tabBarData = [
      '추천',
      '가슴',
      '등',
      '어깨',
      '팔',
      '복근',
      '하체',
      // '앞 허벅지',
      // '뒷 허벅지',
      // '종아리',
    ];

    /// 각 TabBar마다 어떤 뷰를 보여줄지 정해주는 List
    /// ex) ['상체', '가슴']
    ///  - 상체 전체의 자극을 줄 수 있는 운동
    ///  - 가슴에 자극을 줄 수 있는 운동만 보여줌
    List<String> tabBodyData = [
      '추천',
      '가슴',
      '등',
      '어깨',
      '팔',
      '복근',
      '하체',
      // '앞 허벅지',
      // '뒷 허벅지',
      // '종아리',
    ];

    return Column(
      children: [
        /// Tap Bar
        PoseMainTabBar(tabBarData: tabBarData, tabBodyData: tabBodyData),

        /// Tab Contents
        PoseMainTabBody(useNavigator: true, tabBodyData: tabBodyData),
      ],
    );
  }
}
