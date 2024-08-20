import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_navigation.dart';

class AddToRoutineAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddToRoutineAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 20.w ),
          child: GestureDetector(
            onTap: () => MaeumNavigator.pop(context),
            child: ImageWidget(
              image: Images.arrowLeft,
              width: 24.w,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}