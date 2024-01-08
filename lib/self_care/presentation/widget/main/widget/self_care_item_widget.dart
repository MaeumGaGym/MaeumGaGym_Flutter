import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareItemWidget extends StatelessWidget {
  final String imagePath;
  final String title;

  const SelfCareItemWidget({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center, // 이것도 align 지정안하면 크기 변경 안돼요
                  decoration: BoxDecoration(
                    color: MaeumgagymColor.gray200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SvgPicture.asset(
                    imagePath,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              PtdTextWidget.bodyLarge(
                title,
                MaeumgagymColor.black,
              ),
            ],
          ),
          SvgPicture.asset(
            "assets/image/core_icon/right_arrow_icon.svg",
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}
