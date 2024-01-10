import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class HomeMainContentWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final String content;
  const HomeMainContentWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 240,
        height: 240,
        decoration: BoxDecoration(
          color: MaeumgagymColor.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/image/home_icon/calculate_icon.svg"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PtdTextWidget.titleMedium(
                    "칼로리 계산기",
                    MaeumgagymColor.black,
                  ),
                  const SizedBox(height: 8),
                  PtdTextWidget.bodyMedium(
                    "먹은 음식의 칼로리를\n계산해 보세요.",
                    MaeumgagymColor.black,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
