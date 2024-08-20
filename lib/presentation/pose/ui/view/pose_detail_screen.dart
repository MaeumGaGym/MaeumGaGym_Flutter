import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/pose/entity/pose_detail_entity.dart';
import 'package:maeumgagym_flutter/presentation/pose/ui/widget/pose_detail/pose_detail_app_bar.dart';
import 'package:maeumgagym_flutter/presentation/pose/ui/widget/pose_detail/pose_detail_tag_widget.dart';
import 'package:maeumgagym_flutter/presentation/pose/ui/widget/pose_detail/pose_detail_way_list_widget.dart';
import 'package:maeumgagym_flutter/presentation/pose/view_model/pose_detail/pose_detail_bloc.dart';
import 'package:maeumgagym_flutter/presentation/pose/view_model/pose_detail/pose_detail_event.dart';
import 'package:maeumgagym_flutter/presentation/pose/view_model/pose_detail/pose_detail_state.dart';

import '../../../../component/image_widget.dart';

class PoseDetailScreen extends StatefulWidget {
  final int poseId;

  const PoseDetailScreen({super.key, required this.poseId});

  @override
  State<PoseDetailScreen> createState() => _PoseDetailScreenState();
}

class _PoseDetailScreenState extends State<PoseDetailScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<PoseDetailBloc>()
        .add(GetPoseDetailEvent(poseId: widget.poseId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoseDetailBloc, PoseDetailState<PoseDetailEntity>>(
      builder: (context, state) {
        if (state.poseDetailState == BlocStateEnum.loading ||
            state.poseDetailState == BlocStateEnum.empty) {
          return Center(child: CircularProgressIndicator(color: MaeumColor.blue500));
        } else {
          PoseDetailEntity poseDetailData = state.value;

          return MyScaffold(
            appBar: PoseDetailAppBar(poseData: poseDetailData),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 사진
                  Container(
                    width: 1.sw,
                    height: 300.h,
                    alignment: Alignment.center,
                    color: MaeumColor.gray25,
                    child: ImageWidget(
                      image: poseDetailData.thumbnail,
                      imageType: ImageType.pngNetwork,
                    ),
                  ),

                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Simple Name
                        MaeumText.titleMedium(
                            poseDetailData.simpleName, MaeumColor.gray600),

                        SizedBox(height: 8.h),

                        /// Exact Name
                        FittedBox(
                          fit: BoxFit.contain,
                          child: MaeumText.titleLarge(
                            poseDetailData.exactName,
                            MaeumColor.black,
                          ),
                        ),

                        SizedBox(height: 24.h),

                        /// Tags ( SimplePart )
                        Wrap(
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children: List<Widget>.generate(
                            poseDetailData.simplePart.length,
                            (index) {
                              return PoseDetailTagWidget(
                                  tagName: poseDetailData.simplePart[index]);
                            },
                          ),
                        ),

                        SizedBox(height: 24.h),

                        /// 운동 방법 챕터
                        MaeumText.titleMedium('자극 부위', MaeumColor.black),
                        SizedBox(height: 12.h),
                        MaeumText.bodyMedium(
                          poseDetailData.exactPart.toString().substring(1,
                              poseDetailData.exactPart.toString().length - 1),
                          MaeumColor.black,
                        ),

                        SizedBox(height: 48.h),

                        /// 시작 자세
                        PoseDetailWayListWidget(
                          title: '시작 자세',
                          listData: poseDetailData.startPose,
                        ),

                        SizedBox(height: 48.h),

                        /// 운동 방법
                        PoseDetailWayListWidget(
                          title: '운동 방법',
                          listData: poseDetailData.exerciseWay,
                        ),

                        SizedBox(height: 48.h),

                        /// 호흡법
                        PoseDetailWayListWidget(
                          title: '호흡법',
                          listData: poseDetailData.breatheWay,
                        ),

                        SizedBox(height: 48.h),

                        /// 주의사항
                        PoseDetailWayListWidget(
                          title: '주의사항',
                          listData: poseDetailData.caution,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
