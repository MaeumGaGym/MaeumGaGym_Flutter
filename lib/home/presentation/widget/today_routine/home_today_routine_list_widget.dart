import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';

import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/image/image_widget.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';
import '../../../../pose/presentation/view/pose_detail_screen.dart';

class HomeTodayRoutineListWidget extends ConsumerWidget {
  final int repetitions, sets;
  final PoseDataModel poseData;

  const HomeTodayRoutineListWidget({
    super.key,
    required this.poseData,
    required this.repetitions,
    required this.sets,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PoseDetailScreen(
                id: poseData.id!,
                poseData: poseData,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: MaeumgagymColor.gray25,
                      shape: BoxShape.circle,
                    ),
                    child: ImageWidget(
                      image: poseData.thumbnail!,
                      imageType: ImageType.pngNetwork,
                    ),
                  ),
                  const SizedBox(width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PtdTextWidget.bodyLarge(
                        poseData.name!,
                        MaeumgagymColor.black,
                      ),
                      const SizedBox(height: 2),
                      PtdTextWidget.bodyMedium(
                        "${repetitions!}개 | $sets세트",
                        MaeumgagymColor.gray400,
                      ),
                    ],
                  ),
                ],
              ),
               ImageWidget(
                image: Images.chevronRight,
                width: 24,
                height: 24,
                color: MaeumgagymColor.gray200,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
