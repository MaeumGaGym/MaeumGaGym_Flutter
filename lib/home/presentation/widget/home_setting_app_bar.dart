import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class HomeSettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeSettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          centerTitle: true,
          backgroundColor: MaeumgagymColor.white,
          leading: Center(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const ImageWidget(
                width: 32,
                image: Images.arrowLeft,
              ),
              // child: SvgPicture.asset(
              //   "assets/image/core_icon/left_arrow_icon.svg",
              //   width: 32,
              //   height: 32,
              //   color: MaeumgagymColor.black,
              // ),
            ),
          ),
          title: PtdTextWidget.labelLarge(
            "설정",
            MaeumgagymColor.black,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
