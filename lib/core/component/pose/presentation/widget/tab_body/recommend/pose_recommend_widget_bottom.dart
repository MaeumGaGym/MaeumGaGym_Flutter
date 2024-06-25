import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/domain/model/exercise_info_edit_routine_pose_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_pose_list_provider.dart';

import '../../../../../../../config/maeumgagym_color.dart';
import '../../../../../../../pose/presentation/view/pose_detail_screen.dart';
import '../../../../../text/pretendard/ptd_text_widget.dart';

class PoseRecommendWidgetBottom extends ConsumerWidget {
  final List<PoseDataModel> recommendPoseData;
  final bool useNavigator;

  const PoseRecommendWidgetBottom({
    super.key,
    required this.recommendPoseData,
    required this.useNavigator,
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
                onTap: () {
                  if (useNavigator == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoseDetailScreen(
                          id: poseData.id!,
                          poseData: poseData,
                        ),
                      ),
                    );
                  } else {
                    ref.read(selfCareMyRoutinePostListProvider.notifier).insert(
                      ExerciseInfoEditRoutinePoseModel(
                        poseModel: PoseDataModel(
                            id: recommendPoseData[index].id,
                            thumbnail: recommendPoseData[index].thumbnail,
                            name: recommendPoseData[index].name,
                            needMachine: recommendPoseData[index].needMachine,
                            simplePart: recommendPoseData[index].simplePart,
                            exactPart: recommendPoseData[index].exactPart),
                        repetitionsController: TextEditingController(text: "10"),
                        setsController: TextEditingController(text: "1"),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ImageWidget(
                    backgroundColor: MaeumgagymColor.gray25,
                    radiusCircular: 8,
                    width: 148,
                    height: 148,
                    image: poseData.thumbnail!,
                    imageType: ImageType.pngNetwork,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              /// SimpleName
              SizedBox(
                width: 148,
                child: PtdTextWidget.labelMedium(
                  poseData.name!,
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
