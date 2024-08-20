import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';

class MetronomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MetronomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MaeumColor.white,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => MaeumNavigator.pop(context),
                child: ImageWidget(
                  image: Images.arrowLeft,
                  width: 32.w,
                  height: 32.h,
                ),
              ),
              GestureDetector(
                // onTap: () => Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const HomeMetronomeSettingScreen(),
                //   ),
                // ),
                child: ImageWidget(
                  image: Images.iconsDotsVertical,
                  width: 32.w,
                  height: 32.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.h);
}
