import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/routine_add_pose_list_state_cubit.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/routine_add_pose_list_state_model.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/widget/routine_add_edit_pose_item_count_widget.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';

class RoutineAddEditPoseListWidget extends StatelessWidget {
  const RoutineAddEditPoseListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutineAddPoseListStateCubit, List<RoutineAddPoseListStateModel>>(
      builder: (_, state) {
        return SizedBox(
          height: 220.h * state.length + 50.h,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: state.length == index ? 98.h : 40.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            /// 아이템 사진
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: ImageWidget(
                                width: 80.w,
                                height: 80.h,
                                imageType: ImageType.pngNetwork,
                                image: state[index].poseData.thumbnail,
                                backgroundColor: MaeumColor.gray25,
                              ),
                            ),

                            SizedBox(width: 18.w),

                            /// 아이템 이름
                            MaeumText.bodyLarge(
                              state[index].poseData.name,
                              MaeumColor.black,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => context.read<RoutineAddPoseListStateCubit>().delete(index),
                          child: ImageWidget(
                            image: Images.editClose,
                            imageWidth: 24.w,
                            imageHeight: 24.h,
                            color: MaeumColor.gray700,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12.h),

                    RoutineAddEditPoseItemCountWidget(
                      title: "횟수",
                      controller: state[index].repetitionsController,
                    ),

                    SizedBox(height: 12.h),

                    RoutineAddEditPoseItemCountWidget(
                      title: "세트",
                      controller: state[index].setsController,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
