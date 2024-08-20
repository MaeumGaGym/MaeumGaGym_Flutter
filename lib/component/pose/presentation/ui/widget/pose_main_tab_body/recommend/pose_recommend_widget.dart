import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/ui/widget/pose_main_tab_body/recommend/pose_recommend_widget_bottom.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/ui/widget/pose_main_tab_body/recommend/pose_reommend_widget_top.dart';

import '../../../../../domain/entity/pose_recommend_entity.dart';

class PoseRecommendWidget extends StatelessWidget {
  final String titleText;
  final bool goDetail;
  final PoseRecommendEntity recommendPoseData;


  const PoseRecommendWidget({
    required this.titleText,
    required this.goDetail,
    required this.recommendPoseData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 340.h,
      child: Column(
        children: [
          SizedBox(height: 24.h),

          /// ~~ 운동 상단
          PoseRecommendWidgetTop(
            titleText: titleText,
          ),

          /// ~ 운동 하단
          PoseRecommendWidgetBottom(
            goDetail: goDetail,
            poses: recommendPoseData.poses,
          ),
        ],
      ),
    );
  }
}