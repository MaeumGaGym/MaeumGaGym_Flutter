import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/presentation/view/pose_main_tab_bar.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/presentation/view/pose_main_tab_body.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

class SelfCareMyRoutinePoseAddScreen extends StatefulWidget {
  const SelfCareMyRoutinePoseAddScreen({super.key});

  @override
  State<SelfCareMyRoutinePoseAddScreen> createState() =>
      _SelfCareMyRoutinePoseAddScreenState();
}

class _SelfCareMyRoutinePoseAddScreenState
    extends State<SelfCareMyRoutinePoseAddScreen>
    with SingleTickerProviderStateMixin {
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
  List<String> tabBodyData = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: Images.editClose,
        title: "루틴 자세 추가",
      ),
      body: Column(
        children: [
          /// Tap Bar
          PoseMainTabBar(tabBarData: tabBarData, tabBodyData: tabBodyData),

          /// Tab Contents
          PoseMainTabBody(useNavigator: false, tabBodyData: tabBodyData),
        ],
      ),
    );
  }
}
