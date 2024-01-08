import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareProfileSettingItemWidget extends StatelessWidget {
  final String title;

  const SelfCareProfileSettingItemWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PtdTextWidget.labelLarge(
            title,
            MaeumgagymColor.black,
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              "assets/image/core_icon/right_arrow_icon.svg",
            ),
          ),
        ],
      ),
    );
  }
}
