import 'package:flutter/material.dart';

import '../../../../../component/pose/presentation/ui/widget/pose_tab_bar.dart';
import '../../../../../component/pose/presentation/ui/widget/pose_tab_body.dart';

/// 자세(글씨)까지를 제외한 고정되는 Pose Contents들
class PoseMainBody extends StatelessWidget {
  const PoseMainBody({super.key});

  @override
  Widget build(BuildContext context) {
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
        PoseTabBar(tabBarData: tabBarData),

        /// Tab Contents
        PoseTabBody(tabBodyData: tabBodyData, goDetail: true),
      ],
    );
  }
}