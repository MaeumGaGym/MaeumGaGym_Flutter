import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/image_widget.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/metronome/entity/metronome_entity.dart';
import 'package:maeumgagym_flutter/presentation/timer_metronome/view_model/metronome/metronome_state_cubit.dart';

class MetronomeContainer extends StatelessWidget {
  const MetronomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: BlocBuilder<MetronomeStateCubit, MetronomeEntity>(
        builder: (_, state) {
          final MetronomeEntity metronomeData = state;
          final isStart = metronomeData.onPlay;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  /// Metronome Image
                  ImageWidget(
                    image: Images.timeMetronome,
                    width: 24.w,
                    color: MaeumColor.gray400,
                  ),

                  SizedBox(width: 24.w),

                  /// BPM
                  SizedBox(
                    width: 104.w,
                    height: 48,
                    // fittedBox로 감싼 이유는 크기지정을 해주고 그 크기에 맞게 설정하고 싶었기 때문
                    // 크기 설정 이유는 plus minus 버튼이 움직이게 되어 불편하였음
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MaeumText.titleLarge(
                            metronomeData.bpm.toString(),
                            isStart ? MaeumColor.blue500 : MaeumColor.gray300,
                          ),
                          SizedBox(width: 8.w),
                          Padding(
                            padding: EdgeInsets.only(bottom: 6.h),
                            child: MaeumText.titleSmall(
                              "BPM",
                              isStart ? MaeumColor.blue500 : MaeumColor.gray400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 24.w),

                  Row(
                    children: [
                      /// MinusButton
                      GestureDetector(
                        onTap: () => context.read<MetronomeStateCubit>().decreaseBpm(),
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: MaeumColor.gray50,
                            shape: BoxShape.circle,
                          ),
                          child: ImageWidget(
                            image: Images.editRemoveMinus,
                            width: 16.w,
                          ),
                        ),
                      ),

                      SizedBox(width: 8.w),

                      /// Plus button
                      GestureDetector(
                        onTap: () => context.read<MetronomeStateCubit>().increaseBpm(),
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: MaeumColor.gray50,
                            shape: BoxShape.circle,
                          ),
                          child: ImageWidget(
                            image: Images.editAdd,
                            width: 16.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              /// Play / Pause Button
              GestureDetector(
                onTap: () {
                  if (isStart) {
                    context.read<MetronomeStateCubit>().onPause();
                  } else {
                    context.read<MetronomeStateCubit>().onPlay();
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isStart ? MaeumColor.gray50 : MaeumColor.blue500,
                    shape: BoxShape.circle,
                  ),
                  child: ImageWidget(
                    image: isStart ? Images.mediaPause : Images.mediaPlayFilled,
                    width: 20.w,
                    color: isStart ? MaeumColor.black : MaeumColor.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
