import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class HomeMainContainerTitle extends StatelessWidget {
  final String title;

  const HomeMainContainerTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PtdTextWidget.titleMedium(
            title,
            MaeumgagymColor.black,
          ),
          GestureDetector(
            child: SvgPicture.asset(
              'assets/image/core_icon/right_arrow_icon.svg',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}