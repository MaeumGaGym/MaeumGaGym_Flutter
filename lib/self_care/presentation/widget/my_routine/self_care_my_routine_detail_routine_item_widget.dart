import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/provider/routine_my_routine_my_routine_provider.dart';

class SelfCareMyRoutineDetailRoutineItemWidget extends ConsumerWidget {
  final int routineListIndex;
  final int exerciseInfoListIndex;

  const SelfCareMyRoutineDetailRoutineItemWidget({
    super.key,
    required this.routineListIndex,
    required this.exerciseInfoListIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myRoutineState = ref.watch(routineMyRoutinesProvider);
    final item = myRoutineState.routineList[routineListIndex]
        .exerciseInfoResponseList[exerciseInfoListIndex];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipOval(
              child: ImageWidget(
                width: 80,
                height: 80,
                imageType: ImageType.pngNetwork,
                image: item.pose.thumbnail.toString(),
                backgroundColor: MaeumgagymColor.gray25,
              ),
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PtdTextWidget.bodyLarge(
                  item.pose.name.toString(),
                  MaeumgagymColor.black,
                ),
                const SizedBox(height: 2),
                PtdTextWidget.bodyMedium(
                  "${item.repetitions}개 | ${item.sets}세트",
                  MaeumgagymColor.gray400,
                ),
              ],
            ),
          ],
        ),
        ImageWidget(
          image: Images.chevronRight,
          color: MaeumgagymColor.gray200,
          imageHeight: 24,
          imageWidth: 24,
        ),
      ],
    );
  }
}
