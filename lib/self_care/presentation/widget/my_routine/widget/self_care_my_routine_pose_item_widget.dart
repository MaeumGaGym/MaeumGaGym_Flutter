import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareMyRoutinePoseItemWidget extends StatelessWidget {
  const SelfCareMyRoutinePoseItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: MaeumgagymColor.gray25,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(width: 18),
                PtdTextWidget.bodyLarge(
                  "푸시업",
                  MaeumgagymColor.black,
                ),
              ],
            ),
            SvgPicture.asset(
              "assets/image/self_care_icon/close_icon.svg",
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: PtdTextWidget.bodyMedium(
                "횟수",
                MaeumgagymColor.black,
              ),
            ),
            /// 횟수 입력 칸
            const SizedBox.shrink(),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: PtdTextWidget.bodyMedium(
                "세트",
                MaeumgagymColor.black,
              ),
            ),
            /// 세트 수 입력 칸
            const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
