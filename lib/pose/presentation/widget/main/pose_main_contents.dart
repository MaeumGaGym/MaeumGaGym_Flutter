/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/view/pose_main_tab_bar.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/view/pose_main_tab_body.dart';

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
      '앞 허벅지',
      '뒷 허벅지',
      '종아리',
    ];

    /// 각 TabBar마다 어떤 뷰를 보여줄지 정해주는 List
    /// ex) ['상체', '가슴']
    ///  - 상체 전체의 자극을 줄 수 있는 운동
    ///  - 가슴에 자극을 줄 수 있는 운동만 보여줌
    List<List<String>> tabBodyData = [
      ['상체', '가슴'],
      ['상체', '등'],
      ['상체', '어깨'],
      ['상체', '팔'],
      ['상체', '복근'],
      ['하체', '앞 허벅지'],
      ['하체', '뒷 허벅지'],
      ['하체', '종아리'],
    ];

    return Column(
      children: [
        /// Tap Bar
        PoseMainTabBar(tabBarData: tabBarData),

        /// Tab Contents
        PoseMainTabBody(useNavigator: true, tabBodyData: tabBodyData),
      ],
    );
  }
}
