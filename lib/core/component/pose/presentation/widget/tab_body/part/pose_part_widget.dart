/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_data_model.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/provider/pose_detail_provider.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/view/pose_detail_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/domain/model/exercise_info_edit_routine_pose_model.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_pose_list_provider.dart';

import '../../../../../../../config/maeumgagym_color.dart';
import '../../../../../text/pretendard/ptd_text_widget.dart';

class PosePartWidget extends ConsumerWidget {
  final PoseDataModel data;
  final bool useNavigator;

  const PosePartWidget({
    required this.data,
    required this.useNavigator,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        /// useNavigator 가 true 일때
        if (useNavigator) {
          if (context.mounted) {
            /// 눌렀을 때 PoseDetailScreen
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PoseDetailScreen(id: data.id!),
              ),
            );
          }
        } else {
          ref.read(selfCareMyRoutineEditProvider.notifier).insert(
                ExerciseInfoEditRoutinePoseModel(
                  poseModel: PoseDataModel(
                    id: data.id,
                    thumbnail: data.thumbnail,
                    name: data.name,
                    needMachine: data.needMachine,
                    simplePart: data.simplePart,
                  ),
                  repetitionsController: TextEditingController(text: "10"),
                  setsController: TextEditingController(text: "1"),
                ),
              );
          Navigator.pop(context);
        }
        debugPrint('out');
        ref.read(poseDetailController.notifier).setDetailData();
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// 운동 사진
              ImageWidget(
                image: data.thumbnail!,
                imageType: ImageType.pngNetwork,
                width: 64,
                height: 64,
                radiusCircular: 8,
                imageHeight: 200,
                backgroundColor: MaeumgagymColor.gray25,
              ),
              const SizedBox(width: 18),

              /// 운동 이름
              SizedBox(
                width: MediaQuery.of(context).size.width - 122,
                child:
                    PtdTextWidget.bodyMedium(data.name!, MaeumgagymColor.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
