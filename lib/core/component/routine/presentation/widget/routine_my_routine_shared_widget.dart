import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class RoutineMyRoutineSharedWidget extends StatelessWidget {
  final Color? color;

  const RoutineMyRoutineSharedWidget({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? MaeumgagymColor.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            PtdTextWidget.labelMedium(
              "공유됨",
              MaeumgagymColor.blue500,
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              "assets/image/self_care_icon/earth_icon.svg",
              width: 16,
              height: 16,
              color: MaeumgagymColor.blue500,
            ),
          ],
        ),
      ),
    );
  }
}
