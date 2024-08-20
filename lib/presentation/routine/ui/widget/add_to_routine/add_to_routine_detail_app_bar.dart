import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_navigation.dart';

class AddToRoutineDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String routineName;

  const AddToRoutineDetailAppBar({
    super.key,
    required this.routineName,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => MaeumNavigator.pop(context),
                child: ImageWidget(
                  image: Images.arrowLeft,
                  width: 24.w,
                ),
              ),

              SizedBox(width: 24.w),
              MaeumText.labelLarge(routineName, MaeumColor.black),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}
