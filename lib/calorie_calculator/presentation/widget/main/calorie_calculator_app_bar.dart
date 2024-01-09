/// Package
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class CalorieCalculatorAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CalorieCalculatorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Opacity(
          opacity: 0.48,
          child: AppBar(
            scrolledUnderElevation: 0,
            centerTitle: true,
            backgroundColor: MaeumgagymColor.white,
            leading: SvgPicture.asset(
              'assets/image/core_icon/left_arrow_icon.svg',
            ),
            leadingWidth: 32,
            title: PtdTextWidget.labelLarge('칼로리 계산기', MaeumgagymColor.black),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
