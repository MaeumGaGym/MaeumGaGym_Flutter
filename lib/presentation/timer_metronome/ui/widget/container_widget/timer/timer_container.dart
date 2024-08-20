import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_loding_indicator.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/domain/timer/entity/timers_entity.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/add_timer_bottom_sheet.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/ui/widget/container_widget/timer/container_timer_list_widget.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_state.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/timer/timer_state_cubit.dart';

import '../../../../../../component/image_widget.dart';
import '../../../../../../core/images.dart';
import '../../../../../../core/maeum/maeum_text.dart';

class TimerContainer extends StatelessWidget {
  const TimerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerStateCubit, TimerState<TimersEntity>>(
      builder: (_, state) {
        if (state.timerState == BlocStateEnum.loading) {
          return const MaeumLoadingIndicator();
        } else {
          return Column(
            children: [
              /// Container Timer List Widget
              Builder(
                  builder: (_) {
                    if(state.value.timers.isEmpty){
                      return Container(
                        margin: EdgeInsets.only(bottom: 18.h),
                        height: 64.h,
                        alignment: Alignment.center,
                        child: MaeumText.bodyLarge(
                          '설정한 타이머가 없어요',
                          MaeumColor.gray400,
                        ),
                      );
                    }
                    return const ContainerTimerListWidget();
                  }
              ),

              /// Timer Add Button
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const AddTimerBottomSheet();
                    },
                  );
                },
                child: Container(
                  width: 1.sw - 64.w,
                  height: 48.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: MaeumColor.gray50,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: ImageWidget(
                    image: Images.editAdd,
                    width: 24.w,
                    height: 24.h,
                    color: MaeumColor.gray800,
                  ),
                ),
              ),

              SizedBox(height: 16.h),
            ],
          );
        }
      },
    );
  }
}
