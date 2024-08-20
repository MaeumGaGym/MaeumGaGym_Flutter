import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_navigation.dart';
import '../../../../../core/maeum/maeum_text.dart';

class RoutineAddPoseAppBar extends StatelessWidget implements PreferredSizeWidget{
  const RoutineAddPoseAppBar({super.key});

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
                image: Images.editClose,
                width: 28.w,
              ),
            ),
            SizedBox(width: 24.w),
            MaeumText.labelLarge("루틴 자세 추가", MaeumColor.black),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}
