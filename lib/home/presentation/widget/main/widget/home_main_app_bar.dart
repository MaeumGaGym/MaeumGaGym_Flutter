import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class HomeMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const HomeMainAppBar({
    super.key,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MaeumgagymColor.white,
      scrolledUnderElevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/image/core_icon/logo.png',
                width: 42,
                height: 17,
              ),
              const SizedBox(width: 4),
              PtdTextWidget.titleMedium(
                "마음가짐",
                MaeumgagymColor.gray800,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/image/home_icon/setting_icon.svg',
              width: 28,
              height: 28,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}