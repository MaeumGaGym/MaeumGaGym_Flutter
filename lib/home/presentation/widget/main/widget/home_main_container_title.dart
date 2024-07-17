import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
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
            child: ImageWidget(
              image: Images.chevronRight,
              width: 24,
              height: 24,
              color: MaeumgagymColor.gray200,
            ),
          ),
        ],
      ),
    );
  }
}
