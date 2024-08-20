import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/component/pose/presentation/view_model/pose_machine_state_cubit.dart';

class PoseMachineSelectorWidget extends StatelessWidget {
  const PoseMachineSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PoseMachineSelectorEnum posePartState = context.watch<PoseMachineSelectorEnumCubit>().state;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// 맨몸
          GestureDetector(
            onTap: () => context.read<PoseMachineSelectorEnumCubit>().changeCalisthenics(),
            child: Container(
              /// Tag가 선택시 blue500 아닐 시 gray50
              decoration: BoxDecoration(
                color: posePartState == PoseMachineSelectorEnum.calisthenics
                    ? MaeumColor.blue500
                    : MaeumColor.gray50,
                borderRadius: BorderRadius.circular(100.r),
              ),

              /// Tag이름
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: MaeumText.labelMedium(
                  '맨몸',
                  posePartState == PoseMachineSelectorEnum.calisthenics
                      ? MaeumColor.white
                      : MaeumColor.gray600,
                ),
              ),
            ),
          ),

          /// SizedBox
          SizedBox(width: 8.w),

          /// 기구
          GestureDetector(
            onTap: () => context.read<PoseMachineSelectorEnumCubit>().changeMachine(),
            child: Container(
              /// Tag가 선택시 blue500 아닐 시 gray50
              decoration: BoxDecoration(
                color: posePartState == PoseMachineSelectorEnum.machine
                    ? MaeumColor.blue500
                    : MaeumColor.gray50,
                borderRadius: BorderRadius.circular(100.r),
              ),

              /// Tag이름
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: MaeumText.labelMedium(
                  '기구',
                  posePartState == PoseMachineSelectorEnum.machine
                      ? MaeumColor.white
                      : MaeumColor.gray600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}