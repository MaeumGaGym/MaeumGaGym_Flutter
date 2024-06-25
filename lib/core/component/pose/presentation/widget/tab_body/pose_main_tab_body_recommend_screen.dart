/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/presentation/provider/pose_recommend_provider.dart';

/// Widget
import 'recommend/pose_recommend_widget.dart';

class PoseMainTabBodyRecommendScreen extends ConsumerWidget {
  final bool useNavigator;
  const PoseMainTabBodyRecommendScreen({super.key, required this.useNavigator});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final poseRecommend = ref.read(poseRecommendController);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: poseRecommend.poses!.keys.length,
        itemBuilder: (context, index) {
          return PoseRecommendWidget(
            recommendPoseData: poseRecommend
                .poses![poseRecommend.poses!.keys.toList()[index]]!,
            titleText: poseRecommend.poses!.keys.toList()[index],
            useNavigator: useNavigator,
          );
        },
      ),
    );
  }
}
