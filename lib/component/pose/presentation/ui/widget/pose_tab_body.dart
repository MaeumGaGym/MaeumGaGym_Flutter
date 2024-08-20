import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/ui/widget/pose_main_tab_body/part/pose_main_tab_body_part_list.dart';

import '../../view_model/pose_tab_state_cubit.dart';
import 'pose_main_tab_body/recommend/pose_main_tab_body_recommend_list.dart';


class PoseTabBody extends StatelessWidget {
  final bool goDetail;
  final List<String> tabBodyData;

  const PoseTabBody({
    super.key,
    required this.goDetail,
    required this.tabBodyData,
  });

  @override
  Widget build(BuildContext context) {
    final String poseTabValue = tabBodyData[context.watch<PoseTabStateCubit>().state];

    /// Tab Contents
    return Expanded(
      child: Builder(
        builder: (_) {
          if (poseTabValue == "추천") {
            return PoseMainTabBodyRecommendList(
              goDetail: goDetail,
            );
          } else {
            return PoseMainTabBodyPartList(
              tabName: poseTabValue,
              goDetail: goDetail,
            );
          }
        },
      ),
    );
  }
}