/// Package
import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/presentation/widget/tab_body/recommend/pose_recommend_widget_bottom.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/presentation/widget/tab_body/recommend/pose_recommend_widget_top.dart';

class PoseRecommendWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final int index;
  final String keyData, titleImage, titleText;

  const PoseRecommendWidget({
    required this.data,
    required this.keyData,
    required this.titleImage,
    required this.index,
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
            index: index,
          ),

          /// ~ 운동 하단
          PoseRecommendWidgetBottom(keyData: keyData, data: data),
        ],
      ),
    );
  }
}
