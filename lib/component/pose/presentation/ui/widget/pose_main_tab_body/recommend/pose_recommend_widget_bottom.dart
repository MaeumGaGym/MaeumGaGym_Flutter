import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/routine_add_pose_list_state_cubit.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/routine_add_pose_list_state_model.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/core/pose_model/pose_entity.dart';
import 'package:maeumgagym_flutter/presentation/pose/ui/view/pose_detail_screen.dart';

import '../../../../../../image_widget.dart';

class PoseRecommendWidgetBottom extends StatelessWidget {
  final bool goDetail;
  final List<PoseEntity> poses;

  const PoseRecommendWidgetBottom({
    super.key,
    required this.goDetail,
    required this.poses,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: poses.length,
        itemBuilder: (_, index) {
          final poseData = poses[index];

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  if(goDetail){
                    MaeumNavigator.push(context, PoseDetailScreen(poseId: poseData.id));
                  } else {
                    context.read<RoutineAddPoseListStateCubit>().insert(
                          RoutineAddPoseListStateModel(
                            poseData: poseData,
                            repetitionsController: TextEditingController(text: "10"),
                            setsController: TextEditingController(text: "1"),
                            repetitionsNode: FocusNode(),
                            setsNode: FocusNode(),
                          ),
                        );
                    MaeumNavigator.pop(context);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: ImageWidget(
                    backgroundColor: MaeumColor.gray25,
                    radiusCircular: 8.r,
                    width: 148.w,
                    height: 148.h,
                    image: poseData.thumbnail,
                    imageType: ImageType.pngNetwork,
                  ),
                ),
              ),
              SizedBox(height: 8.h),

              /// SimpleName
              SizedBox(
                width: 148.w,
                child: MaeumText.labelMedium(
                  poseData.name,
                  MaeumColor.black,
                ),
              ),
              SizedBox(height: 4.h),

              /// SimplePart
              MaeumText.bodyMedium(
                poseData.simplePart
                    .toString()
                    .substring(1, poseData.simplePart.toString().length - 1),
                MaeumColor.black,
              ),
            ],
          );
        },
      ),
    );
  }
}
