import 'package:flutter/material.dart';

import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class AddFoodAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddFoodAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/image/core_icon/close_icon.png',
              width: 16,
              height: 16,
            ),
            PtdTextWidget.labelLarge('음식 추가', MaeumgagymColor.black),
            Image.asset(
              'assets/image/core_icon/check_icon.png',
              width: 21.33,
              height: 13.33,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
