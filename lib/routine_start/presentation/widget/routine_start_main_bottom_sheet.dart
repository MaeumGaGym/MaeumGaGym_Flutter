import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/routine_start/presentation/widget/routine_start_main_bottom_sheet_button.dart';

import '../../../config/maeumgagym_color.dart';
import '../../../core/component/image/images.dart';
import '../../../core/component/text/pretendard/ptd_text_widget.dart';
import '../provider/routine_start_exercise_provider.dart';

class RoutineStartMainBottomSheet extends StatefulWidget {
  const RoutineStartMainBottomSheet({super.key});

  @override
  State<RoutineStartMainBottomSheet> createState() => _RoutineStartMainBottomSheetState();
}

class _RoutineStartMainBottomSheetState extends State<RoutineStartMainBottomSheet> {
  late StreamSubscription<int> stream;

  @override
  void initState() {
    super.initState();
    stream = Stream.periodic(const Duration(microseconds: 500), (x) => x).listen((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    stream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      width: MediaQuery.of(context).size.width,
      height: 110,
      color: MaeumgagymColor.gray25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PtdTextWidget.labelSmall("휴식시간", MaeumgagymColor.blue500, null, null),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Consumer(
                    builder: (context, ref, child) => PtdTextWidget.titleLarge(
                      ref
                          .watch(routineStartExerciseProvider).restTimer
                          .currentTime.inSeconds.toString(),
                      MaeumgagymColor.black,
                    ),
                  ),
                  PtdTextWidget.titleMedium("초", MaeumgagymColor.black),
                ],
              ),

              Consumer(
                builder: (context, ref, child) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => ref.read(routineStartExerciseProvider.notifier).minusRestTime()),
                        child: const RoutineStartMainBottomSheetButton(
                          icon: Images.editRemoveMinus,
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () => setState(() => ref.read(routineStartExerciseProvider.notifier).addRestTime()),
                        child: const RoutineStartMainBottomSheetButton(
                          icon: Images.editAdd,
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}