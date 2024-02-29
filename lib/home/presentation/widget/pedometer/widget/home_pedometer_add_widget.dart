import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class HomePedometerAddWidget extends StatelessWidget {
  const HomePedometerAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/image/home_icon/add_widget_icon.svg",
                ),
                const SizedBox(width: 16),
                PtdTextWidget.bodyLarge(
                  "위젯 추가",
                  MaeumgagymColor.black,
                ),
              ],
            ),
            SvgPicture.asset(
              "assets/image/core_icon/right_arrow_icon.svg",
              color: MaeumgagymColor.gray200,
            ),
          ],
        ),
      ),
    );
  }
}
