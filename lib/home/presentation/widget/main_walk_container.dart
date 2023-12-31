import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class MainWalkContainer extends StatefulWidget {
  // final String steps; // 걸음 수
  const MainWalkContainer({super.key});

  @override
  State<MainWalkContainer> createState() => _MainWalkContainerState();
}

class _MainWalkContainerState extends State<MainWalkContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MaeumgagymColor.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                PtdTextWidget.titleLarge(
                  "2,771", // 변경될 값
                  MaeumgagymColor.blue500,
                ),
                const SizedBox(width: 12),
                PtdTextWidget.titleSmall(
                  "걸음",
                  MaeumgagymColor.gray600,
                ),
              ],
            ),
            GestureDetector(
              child: SvgPicture.asset(
                'assets/image/right_arrow_icon.svg',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}