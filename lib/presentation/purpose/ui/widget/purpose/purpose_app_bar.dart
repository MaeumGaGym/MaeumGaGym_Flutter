import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_navigation.dart';

class PurposeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PurposeAppBar({super.key});

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
              child: ImageWidget(
                image: Images.arrowLeft,
                width: 24.w,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}