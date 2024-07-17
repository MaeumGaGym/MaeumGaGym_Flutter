import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';

import '../../../config/maeumgagym_color.dart';
import '../../../core/component/text/pretendard/ptd_text_widget.dart';

class OnBoardingContentsWidget extends StatelessWidget {
  final String image, title;

  const OnBoardingContentsWidget(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: MaeumgagymColor.gray50,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SvgPicture.asset(image),
            ImageWidget(
              image: image,
              imageType: ImageType.png,
              width: 24,
              height: 24,
            ),
            PtdTextWidget.labelMedium(title, Colors.black),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
