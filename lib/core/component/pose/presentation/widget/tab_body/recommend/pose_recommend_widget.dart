/// Package
import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_recommend_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/presentation/widget/tab_body/recommend/pose_recommend_widget_bottom.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/presentation/widget/tab_body/recommend/pose_recommend_widget_top.dart';

class PoseRecommendWidget extends StatelessWidget {
  final List<PoseData> recommendPoseData;

  final String titleImage, titleText;

  const PoseRecommendWidget({
    required this.recommendPoseData,
    required this.titleImage,
    required this.titleText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 340,
      child: Column(
        children: [
          const SizedBox(height: 24),

          /// ~~ 운동 상단
          PoseRecommendWidgetTop(
            titleImage: titleImage,
            titleText: titleText,
          ),

          /// ~ 운동 하단
          PoseRecommendWidgetBottom(recommendPoseData: recommendPoseData),
        ],
      ),
    );
  }
}
