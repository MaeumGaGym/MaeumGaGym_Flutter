import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/image_widget.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';

class RoutineDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RoutineDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => MaeumNavigator.pop(context),
                child: ImageWidget(image: Images.arrowLeft, width: 28.w),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}
