/// Package
import 'package:flutter/material.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class AddFoodAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddFoodAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// 그냥 뒤로가기 버튼
              Image.asset(
                'assets/image/core_icon/close_icon.png',
                width: 16,
                height: 16,
              ),

              /// Title
              PtdTextWidget.labelLarge('음식 추가', MaeumgagymColor.black),

              /// 변경 저장하고 뒤로가기
              Image.asset(
                'assets/image/core_icon/check_icon.png',
                width: 21.33,
                height: 13.33,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
