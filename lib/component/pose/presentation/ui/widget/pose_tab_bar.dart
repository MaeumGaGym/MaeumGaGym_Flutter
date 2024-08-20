import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/ui/widget/pose_main_tab_bar/pose_tab_text_widget.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';

import '../../view_model/pose_machine_state_cubit.dart';
import '../../view_model/pose_tab_state_cubit.dart';

/// PoseMainScreen에 있는 TabBar
class PoseTabBar extends StatelessWidget {
  final List<String> tabBarData;

  const PoseTabBar({super.key, required this.tabBarData});

  @override
  Widget build(BuildContext context) {
    final int poseTabState = context.watch<PoseTabStateCubit>().state;

    return Stack(
      children: [
        /// Divider
        Padding(
          padding: EdgeInsets.only(top: 54.h),
          child: Container(
            height: 2.h,
            color: MaeumColor.gray50,
          ),
        ),

        /// TabBar 글씨
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: SizedBox(
            height: 56.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: tabBarData.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: GestureDetector(
                    onTap: () {
                      context.read<PoseTabStateCubit>().changeState(index);
                      context.read<PoseMachineSelectorEnumCubit>().initState();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          /// 하단 Border가 선택시 blue 아니면 gray
                          bottom: BorderSide(
                            width: 2.w,
                            color: poseTabState == index
                                ? MaeumColor.blue500
                                : MaeumColor.gray50,
                          ),
                        ),
                      ),

                      /// 글자가 선택시 black 아니면 gray
                      child: PoseTabTextWidget(
                        text: tabBarData[index],
                        color: poseTabState == index
                            ? MaeumColor.black
                            : MaeumColor.gray400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}