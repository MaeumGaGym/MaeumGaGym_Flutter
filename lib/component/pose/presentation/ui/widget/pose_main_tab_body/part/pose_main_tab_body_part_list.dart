import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/ui/widget/pose_main_tab_body/part/pose_machine_selector_widget.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/ui/widget/pose_main_tab_body/part/pose_part_widget.dart';

import '../../../../../../../core/pose_model/pose_entity.dart';
import '../../../../../domain/entity/poses_entity.dart';
import '../../../../view_model/pose_all/pose_all_bloc.dart';
import '../../../../view_model/pose_all/pose_all_state.dart';
import '../../../../view_model/pose_machine_state_cubit.dart';

class PoseMainTabBodyPartList extends StatelessWidget {
  final bool goDetail;
  final String tabName;

  const PoseMainTabBodyPartList({
    super.key,
    required this.goDetail,
    required this.tabName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoseAllBloc, PoseAllState<PosesEntity>>(
      builder: (_, state) {
        List<PoseEntity> poseList = state.value.poses
            .where((e) => e.category.contains(tabName))
            .toList();

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
            child: Column(
              children: [
                /// 맨몸 기구 선택란
                const PoseMachineSelectorWidget(),

                /// Part Data List
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: poseList.length,
                  itemBuilder: (_, index) {
                    /// tabName으로 들어온 값이랑 exactPart가 맞지 않으면 SizedBox.shrink()
                    switch (
                        context.watch<PoseMachineSelectorEnumCubit>().state) {
                      case PoseMachineSelectorEnum.calisthenics:
                        return !poseList[index].needMachine
                            ? PosePartWidget(
                                goDetail: goDetail,
                                poseData: poseList[index],
                              )
                            : const SizedBox.shrink();
                      case PoseMachineSelectorEnum.machine:
                        return poseList[index].needMachine
                            ? PosePartWidget(
                                goDetail: goDetail,
                                poseData: poseList[index],
                              )
                            : const SizedBox.shrink();
                      case PoseMachineSelectorEnum.all:
                        return PosePartWidget(
                          goDetail: goDetail,
                          poseData: poseList[index],
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
