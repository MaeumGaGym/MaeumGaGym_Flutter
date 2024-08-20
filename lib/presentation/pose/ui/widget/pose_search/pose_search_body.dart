import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/core/pose_model/pose_entity.dart';
import 'package:maeumgagym_flutter/component/pose/domain/entity/poses_entity.dart';
import 'package:maeumgagym_flutter/presentation/pose/ui/view/pose_detail_screen.dart';
import 'package:maeumgagym_flutter/presentation/pose/view_model/pose_search/pose_search_state_cubit.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../component/pose/presentation/view_model/pose_all/pose_all_bloc.dart';
import '../../../../../component/pose/presentation/view_model/pose_all/pose_all_state.dart';

class PoseSearchBody extends StatelessWidget {
  const PoseSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoseAllBloc, PoseAllState<PosesEntity>>(
      builder: (_, state) {
        final List<PoseEntity> poseList = state.value.poses
            .where((e) => e.name.contains(context.watch<PoseSearchStateCubit>().state))
            .toList();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView.builder(
            itemCount: poseList.length,
            itemBuilder: (_, index) {
              final PoseEntity poseData = poseList[index];

              return GestureDetector(
                onTap: () => MaeumNavigator.push(context, PoseDetailScreen(poseId: poseData.id)),
                child: Container(
                  width: 1.sw - 40.w,
                  color: MaeumColor.white,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Pose Image
                      ImageWidget(
                        image: poseData.thumbnail,
                        imageType: ImageType.pngNetwork,
                        backgroundColor: MaeumColor.gray50,
                        radiusCircular: 8.r,
                        width: 64.w,
                        height: 64.h,
                      ),

                      /// Contents
                      Padding(
                        padding: EdgeInsets.only(left: 18.w),
                        child: SizedBox(
                          width: 1.sw - 122.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// SimpleName
                              MaeumText.bodyMedium(
                                poseData.name,
                                MaeumColor.black,
                              ),

                              /// ExactPart
                              MaeumText.bodyMedium(
                                poseData.simplePart.toString().substring(1, poseData.simplePart.toString().length - 1,),
                                MaeumColor.gray400,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
