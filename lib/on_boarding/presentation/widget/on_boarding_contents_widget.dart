import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/maeumgagym_color.dart';
import '../../../core/component/text/pretendard/ptd_text_widget.dart';

class OnBoardingContentsWidget extends StatelessWidget {
  final String image, title;

  const OnBoardingContentsWidget(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
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
              SvgPicture.asset(image),
              PtdTextWidget.labelMedium(title, Colors.black),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
