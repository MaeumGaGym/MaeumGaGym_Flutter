import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_navigation.dart';
import '../add_timer_bottom_sheet.dart';

class TimerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TimerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// POP 버튼
              GestureDetector(
                onTap: () => MaeumNavigator.pop(context),
                child: ImageWidget(
                  image: Images.arrowLeft,
                  width: 32.w,
                  height: 32.h,
                ),
              ),

              Row(
                children: [
                  /// Timer Add Button
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const AddTimerBottomSheet();
                        },
                      );
                    },
                    child: ImageWidget(
                      image: Images.editAdd,
                      width: 32.w,
                      height: 32.h,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  /// Dots
                  ImageWidget(
                    image: Images.iconsDotsVertical,
                    width: 32.w,
                    height: 32.h,
                  ),
                ],
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
