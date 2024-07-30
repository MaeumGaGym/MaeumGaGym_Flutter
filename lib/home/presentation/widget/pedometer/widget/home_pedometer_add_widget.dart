import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
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
                // SvgPicture.asset(
                //   "assets/image/home_icon/add_widget_icon.svg",
                // ),
                const ImageWidget(
                  image: Images.iconsNotDesignSysAddWidgeticon,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 16),
                PtdTextWidget.bodyLarge(
                  "위젯 추가",
                  MaeumgagymColor.black,
                ),
              ],
            ),
            ImageWidget(
              image: Images.chevronRight,
              width: 24,
              height: 24,
              color: MaeumgagymColor.gray200,
            ),
          ],
        ),
      ),
    );
  }
}
