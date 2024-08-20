import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';

import '../../../../../domain/routines/entity/routines_entity.dart';
import '../../../view_model/today_routine/today_routine_page_state_cubit.dart';

class TodayRoutineContainerPageDots extends StatelessWidget {
  final RoutinesEntity routines;

  const TodayRoutineContainerPageDots({super.key, required this.routines});

  @override
  Widget build(BuildContext context) {
    int todayRoutinePageState = context.watch<TodayRoutinePageStateCubit>().state;

    return Container(
      width: 1.sw - 40.w,
      height: 12.h,
      alignment: Alignment.center,
      /// Dots
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: routines.routines.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(left: 8.w),
            // dot
            child: Container(
              width: 12.w,
              height: 12.h,
              decoration: BoxDecoration(
                color: index == todayRoutinePageState
                    ? MaeumColor.blue500
                    : MaeumColor.gray100,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}
