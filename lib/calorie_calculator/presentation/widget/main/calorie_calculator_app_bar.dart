/// Package
import 'package:flutter/cupertino.dart';
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
    /// 높이 조절
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: MaeumgagymColor.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/image/core_icon/left_arrow_icon.svg',
              width: 32,
              height: 32,
            ),
            PtdTextWidget.labelLarge('칼로리 계산기', MaeumgagymColor.black),
            const SizedBox(
              width: 32,
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  /// 높이 값은 여기에
  @override
  Size get preferredSize => const Size.fromHeight(48);
}
