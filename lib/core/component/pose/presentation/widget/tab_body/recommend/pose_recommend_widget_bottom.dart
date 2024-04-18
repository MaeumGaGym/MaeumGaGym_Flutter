import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_recommend_model.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/provider/pose_detail_provider.dart';

import '../../../../../../../config/maeumgagym_color.dart';
import '../../../../../../../pose/presentation/view/pose_detail_screen.dart';
import '../../../../../text/pretendard/ptd_text_widget.dart';

class PoseRecommendWidgetBottom extends ConsumerWidget {
  final List<PoseData> recommendPoseData;

  const PoseRecommendWidgetBottom({
    super.key,
    required this.recommendPoseData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendPoseData.length,
        itemBuilder: (context, index) {
          final poseData = recommendPoseData[index];

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PoseDetailScreen(
                        id: poseData.id,
                      ),
                    ),
                  );

                  ref.read(poseDetailController.notifier).setDetailData();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ImageWidget(
                    backgroundColor: MaeumgagymColor.gray25,
                    radiusCircular: 8,
                    width: 148,
                    height: 148,
                    image: poseData.thumbnail,
                    imageType: ImageType.pngNetwork,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              /// SimpleName
              SizedBox(
                width: 148,
                child: PtdTextWidget.labelMedium(
                  poseData.name,
                  MaeumgagymColor.black,
                ),
              ),
              const SizedBox(height: 4),

              /// SimplePart
              PtdTextWidget.bodyMedium(
                poseData.simplePart
                    .toString()
                    .substring(1, poseData.simplePart.toString().length - 1),
                MaeumgagymColor.black,
              ),
            ],
          );
        },
      ),
    );
  }
}
