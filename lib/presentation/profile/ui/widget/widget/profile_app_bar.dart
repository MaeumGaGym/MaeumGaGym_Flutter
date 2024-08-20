import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/image_widget.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(width: 20.w),
            GestureDetector(
              onTap: () => MaeumNavigator.pop(context),
              child: ImageWidget(image: Images.arrowLeft, width: 28.w),
            ),
            SizedBox(width: 24.w),
            MaeumText.labelLarge("내 프로필", MaeumColor.black),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}
