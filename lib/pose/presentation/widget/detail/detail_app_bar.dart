/// Package
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: MaeumgagymColor.white,
        surfaceTintColor: MaeumgagymColor.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// POP 버튼
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                'assets/image/core_icon/left_arrow_icon.svg',
                width: 28,
                height: 28,
              ),
            ),

            /// 루틴에 추가
            Container(
              decoration: BoxDecoration(
                  color: MaeumgagymColor.blue50,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Center(
                  child: PtdTextWidget.labelSmall(
                    '루틴에 추가',
                    MaeumgagymColor.blue500,
                    null,
                    null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
