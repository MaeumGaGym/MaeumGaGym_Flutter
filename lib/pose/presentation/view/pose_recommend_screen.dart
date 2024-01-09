/// Package
import 'package:flutter/material.dart';

/// Widget
import '../widget/pose_data.dart';
import '../widget/pose_recommend_widget.dart';

class PoseReCommendScreen extends StatelessWidget {
  const PoseReCommendScreen({super.key});

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
            data: data,
            keyData: '맨몸',
            titleImage: 'assets/image/pose_icon/pose_arm.png',
            index: 1,
          ),

          /// 기구 운동
          PoseRecommendWidget(
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
