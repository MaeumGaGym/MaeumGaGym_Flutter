/// Package
import 'package:flutter/material.dart';

/// Widget
import '../../../../../pose/presentation/widget/pose_data.dart';
import 'recommend/pose_recommend_widget.dart';

class TabBodyRecommendScreen extends StatelessWidget {
  const TabBodyRecommendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 가슴 운동
          PoseRecommendWidget(
            data: data,
            keyData: '가슴',
            titleText: '가슴',
            titleImage: 'assets/image/pose_icon/pose_arm.png',
            index: 1,
          ),

          /// 등 운동
          PoseRecommendWidget(
            data: data,
            keyData: '등',
            titleText: '등',
            titleImage: 'assets/image/pose_icon/pose_machine.png',
            index: 2,
          ),

          /// 어깨 운동
          PoseRecommendWidget(
            data: data,
            keyData: '어깨',
            titleText: '어깨',
            titleImage: 'assets/image/pose_icon/pose_machine.png',
            index: 3,
          ),

          /// 팔 운동
          PoseRecommendWidget(
            data: data,
            keyData: '팔',
            titleText: '팔',
            titleImage: 'assets/image/pose_icon/pose_machine.png',
            index: 4,
          ),

          /// 복근 운동
          PoseRecommendWidget(
            data: data,
            keyData: '복근',
            titleText: '복근',
            titleImage: 'assets/image/pose_icon/pose_machine.png',
            index: 5,
          ),

          /// 앞 허벅지 운동
          PoseRecommendWidget(
            data: data,
            keyData: '하체',
            titleText: '앞 허벅지',
            titleImage: 'assets/image/pose_icon/pose_machine.png',
            index: 6,
          ),

          /// 뒷 허벅지 운동
          PoseRecommendWidget(
            data: data,
            keyData: '하체',
            titleText: '뒷 허벅지',
            titleImage: 'assets/image/pose_icon/pose_machine.png',
            index: 7,
          ),

          /// 종아리 운동
          PoseRecommendWidget(
            data: data,
            keyData: '하체',
            titleText: '종아리',
            titleImage: 'assets/image/pose_icon/pose_machine.png',
            index: 8,
          ),
        ],
      ),
    ));
  }
}
