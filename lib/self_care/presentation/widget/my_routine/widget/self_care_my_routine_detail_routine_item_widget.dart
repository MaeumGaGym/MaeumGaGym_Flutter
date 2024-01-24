import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareMyRoutineDetailRoutineItemWidget extends StatelessWidget {
  const SelfCareMyRoutineDetailRoutineItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: MaeumgagymColor.gray25,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PtdTextWidget.bodyLarge(
                  "푸시업",
                  MaeumgagymColor.black,
                ),
                const SizedBox(height: 2),
                PtdTextWidget.bodyMedium(
                  "10개 | 4세트",
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
