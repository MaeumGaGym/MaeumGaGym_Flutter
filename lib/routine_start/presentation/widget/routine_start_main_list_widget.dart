import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/maeumgagym_color.dart';
import '../../../core/component/image/images.dart';
import '../../../core/component/image/image_widget.dart';
import '../../../core/component/text/pretendard/ptd_text_widget.dart';
import '../provider/routine_start_exercise_provider.dart';

class RoutineStartMainListWidget extends ConsumerWidget {
  final GestureTapCallback onComplete;
  final int pageViewIndex, listViewIndex;

  const RoutineStartMainListWidget({
    super.key,
    required this.pageViewIndex,
    required this.listViewIndex,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routineData = ref.watch(routineStartExerciseProvider).exercises[pageViewIndex];
    return Padding(
      padding: listViewIndex == (routineData.sets! - 1) ? const EdgeInsets.only(bottom: 300) : const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: MaeumgagymColor.gray50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: PtdTextWidget.bodyLarge(
                  (listViewIndex + 1).toString(),
                  MaeumgagymColor.black),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width - 176,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: MaeumgagymColor.gray100),
              borderRadius: BorderRadius.circular(12),
              color: MaeumgagymColor.gray25,
            ),
            child: Center(
              child: PtdTextWidget.bodyLarge(
                routineData.repetitions.toString(),
                MaeumgagymColor.black,
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return GestureDetector(
                onTap: onComplete,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: routineData.completes![listViewIndex]
                          ? MaeumgagymColor.blue500
                          : MaeumgagymColor.gray50,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Visibility(
                      visible: routineData.completes![listViewIndex],
                      child: ImageWidget(
                        width: 24,
                        color: MaeumgagymColor.blue500,
                        image: Images.iconsCheck,
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
