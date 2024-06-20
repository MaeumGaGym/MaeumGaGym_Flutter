import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/empty_view/view/empty_view_screen.dart';

class HomeMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeMainAppBar({super.key});

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
              const ImageWidget(
                image: Images.logosLogo,
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
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EmptyViewScreen(isTap: false),
                ),
              );
            },
            child: ImageWidget(
              image: Images.iconsSetting,
              width: 28,
              height: 28,
              color: MaeumgagymColor.gray400,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52);
}
