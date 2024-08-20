import 'package:flutter/material.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/ui/widget/pose_tab_bar.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/ui/widget/pose_tab_body.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine_add_pose/routine_add_pose_app_bar.dart';

class RoutineAddPoseScreen extends StatelessWidget {
  const RoutineAddPoseScreen({super.key});

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
    ];

    List<String> tabBodyData = [
      '추천',
      '가슴',
      '등',
      '어깨',
      '팔',
      '복근',
      '하체',
    ];

    return MyScaffold(
      appBar: const RoutineAddPoseAppBar(),
      body: Column(
        children: [
          PoseTabBar(tabBarData: tabBarData),
          PoseTabBody(goDetail: false, tabBodyData: tabBodyData)
        ],
      ),
    );
  }
}
