import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/pose/widget/pose_recommend_widget.dart';

import 'package:maeum_ga_gym_flutter/pose/widget/pose_data.dart';

class PoseReCommendScreen extends StatelessWidget {
  final TabController tabContoller;

  const PoseReCommendScreen({required this.tabContoller, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 맨몸 운동
          PoseRecommendWidget(
            tabController: tabContoller,
            data: data,
            keyData: '맨몸',
            titleImage: 'assets/image/pose_icon/pose_arm.png',
            index: 1,
          ),

          /// 기구 운동
          PoseRecommendWidget(
            tabController: tabContoller,
            data: data,
            keyData: '기구',
            titleImage: 'assets/image/pose_icon/pose_machine.png',
            index: 2,
          ),
        ],
      ),
    ));
  }
}
