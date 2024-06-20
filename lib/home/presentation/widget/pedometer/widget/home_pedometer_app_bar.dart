import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class HomePedometerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const HomePedometerAppBar({super.key});

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
                image: Images.arrowLeft,
                width: 32,
                height: 32,
              ),
            ),
          ),
          title: PtdTextWidget.labelLarge(
            "만보기",
            MaeumgagymColor.black,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
