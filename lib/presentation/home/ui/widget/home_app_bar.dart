import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/image_widget.dart';
import '../../../../core/images.dart';
import '../../../../core/maeum/maeum_text.dart';
import '../../../../core/maeum/maeum_color.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        title: Row(
          children: [
            SizedBox(width: 20.w),
            ImageWidget(
              image: Images.logosLogo,
              width: 42.w,
              height: 17.h,
            ),
            SizedBox(width: 4.w),
            MaeumText.titleMedium(
              "마음가짐",
              MaeumColor.gray800,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}
