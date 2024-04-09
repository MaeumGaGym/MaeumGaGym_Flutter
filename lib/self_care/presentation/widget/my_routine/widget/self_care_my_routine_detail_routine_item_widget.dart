import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/my_routine/self_care_my_routine_all_me_routine_provider.dart';

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
    final routineAllMeState = ref.watch(selfCareMyRoutineAllMeRoutineProvider);
    final item = routineAllMeState.routineList[routineListIndex]
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
                image: item.pose!.thumbnail.toString(),
                backgroundColor: MaeumgagymColor.gray25,
              ),
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PtdTextWidget.bodyLarge(
                  item.pose!.name.toString(),
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
        SvgPicture.asset("assets/image/core_icon/right_arrow_icon.svg"),
      ],
    );
  }
}
