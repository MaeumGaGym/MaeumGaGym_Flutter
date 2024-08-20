import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../component/maeum_button.dart';
import '../../../../../core/enum/bloc_state_enum.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../domain/routines/entity/routines_entity.dart';
import '../../../view_model/today_routine/today_routine_bloc.dart';
import '../../../view_model/today_routine/today_routine_state.dart';

class TodayRoutineButton extends StatelessWidget {
  const TodayRoutineButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayRoutineBloc, TodayRoutineState<RoutinesEntity>>(
        builder: (_, state) {
          if(state.todayRoutineState == BlocStateEnum.loading) return const SizedBox.shrink();
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: MaeumButton(
              width: 1.sw - 40.w,
              height: 58.h,
              color: MaeumColor.blue500,
              borderRadius: 8.r,
              leading: ImageWidget(image: Images.mediaPlayFilled, color: MaeumColor.white, width: 24.w),
              text: "루틴 시작하기",
              fontColor: MaeumColor.white,
            ),
          );
        }
    );
  }
}
