import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/image_widget.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

class RoutineAddEditAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? appBarTitle;

  const RoutineAddEditAppBar({super.key,required this.appBarTitle});

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
                width: 28.w,
              ),
            ),
            SizedBox(width: 24.w),
            MaeumText.labelLarge(appBarTitle ?? "루틴 추가", MaeumColor.black),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}
