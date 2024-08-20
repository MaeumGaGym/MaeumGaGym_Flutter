import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/presentation/routine/view_model/routine_day_of_week_state_cubit.dart';

import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_text.dart';

class RoutineDayOfWeekWidget extends StatefulWidget {
  const RoutineDayOfWeekWidget({super.key});

  @override
  State<RoutineDayOfWeekWidget> createState() => _RoutineDayOfWeekWidgetState();
}

class _RoutineDayOfWeekWidgetState extends State<RoutineDayOfWeekWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutineDayOfWeekStateCubit, Map<String, bool>>(
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaeumText.bodyMedium("요일", MaeumColor.black),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(
                7,
                (index) {
                  return GestureDetector(
                    onTap: () => setState(() => context.read<RoutineDayOfWeekStateCubit>().changeState(index)),
                    child: Container(
                      width: (1.sw - 40.w - 24.w) / 7,
                      height: (1.sw - 40.w - 24.w) / 7,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: state.values.elementAt(index)
                            ? MaeumColor.blue500
                            : MaeumColor.gray50,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: MaeumText.bodyMedium(
                        state.keys.elementAt(index),
                        state.values.elementAt(index)
                            ? MaeumColor.white
                            : MaeumColor.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}