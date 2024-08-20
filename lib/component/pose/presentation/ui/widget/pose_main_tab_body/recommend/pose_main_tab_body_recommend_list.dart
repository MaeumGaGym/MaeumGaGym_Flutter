import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/ui/widget/pose_main_tab_body/recommend/pose_recommend_widget.dart';

import '../../../../../../../core/enum/bloc_state_enum.dart';
import '../../../../../../maeum_loding_indicator.dart';
import '../../../../../domain/entity/pose_recommend_list_entity.dart';
import '../../../../view_model/recommend/pose_recommend_bloc.dart';
import '../../../../view_model/recommend/pose_recommend_state.dart';


class PoseMainTabBodyRecommendList extends StatelessWidget {
  final bool goDetail;

  const PoseMainTabBodyRecommendList({super.key, required this.goDetail});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoseRecommendBloc, PoseRecommendState<PoseRecommendListEntity>>(
      builder: (_, state) {
        if(state.poseRecommendState == BlocStateEnum.loading){
          return const MaeumLoadingIndicator();
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.builder(
              itemCount: state.value.responses.length,
              itemBuilder: (_, index) {
                return PoseRecommendWidget(
                  goDetail: goDetail,
                  titleText: state.value.responses[index].category,
                  recommendPoseData: state.value.responses[index],
                );
              },
            ),
          );
        }
      }
    );
  }
}
