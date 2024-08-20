import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/pose/entity/pose_detail_entity.dart';
import 'package:maeumgagym_flutter/domain/routines/entity/routine_entity.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/add_to_routine/add_to_routine_detail_app_bar.dart';

import '../../../../component/image_widget.dart';

class AddToRoutineDetailScreen extends StatelessWidget {
  final RoutineEntity routineData;
  final PoseDetailEntity poseData;

  const AddToRoutineDetailScreen({
    super.key,
    required this.routineData,
    required this.poseData,
  });

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AddToRoutineDetailAppBar(
        routineName: routineData.routineName,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(
            imageType: ImageType.pngNetwork,
            image: poseData.thumbnail,
            backgroundColor: MaeumColor.gray25,
            width: 1.sw,
            height: 300.h,
          ),

          SizedBox(height: 32.h),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaeumText.titleMedium(
                  poseData.simpleName,
                  MaeumColor.gray600,
                ),
                SizedBox(height: 8.h),
                MaeumText.titleLarge(
                  poseData.exactName,
                  MaeumColor.black,
                ),
                // const SizedBox(height: 24),
                // RoutineMyRoutineItemCountWidget(
                //   title: "횟수",
                //   controller: poseRepetitionsTextController,
                // ),
                const SizedBox(height: 12),
                // RoutineMyRoutineItemCountWidget(
                //   title: "세트",
                //   controller: poseSetTextController,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
