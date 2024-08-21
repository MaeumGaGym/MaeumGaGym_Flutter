import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/core/pose_model/pose_entity.dart';
import 'package:maeumgagym_flutter/presentation/pose/ui/view/pose_detail_screen.dart';

import '../../../../../../image_widget.dart';
import '../../../../view_model/routine_add_pose_list_state_cubit.dart';
import '../../../../view_model/routine_add_pose_list_state_model.dart';

class PosePartWidget extends StatelessWidget {
  final bool goDetail;
  final PoseEntity poseData;

  const PosePartWidget({
    required this.goDetail,
    required this.poseData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if(goDetail){
          MaeumNavigator.push(context, PoseDetailScreen(poseId: poseData.id));
        } else {
          context.read<RoutineAddPoseListStateCubit>().insert(
            RoutineAddPoseListStateModel(
              poseData: poseData,
              repetitionsController: TextEditingController(text: "10"),
              setsController: TextEditingController(text: "1"),
            ),
          );

          MaeumNavigator.pop(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// 운동 사진
              ImageWidget(
                image: poseData.thumbnail,
                imageType: ImageType.pngNetwork,
                width: 64.w,
                height: 64.h,
                radiusCircular: 8.r,
                imageHeight: 200.h,
                backgroundColor: MaeumColor.gray25,
              ),
              SizedBox(width: 18.w),

              /// 운동 이름
              SizedBox(
                width: 1.sw - 122.w,
                child: MaeumText.bodyMedium(poseData.name, MaeumColor.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}