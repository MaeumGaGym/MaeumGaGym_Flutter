import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/image_widget.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

class PurposeAddEditAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isAdd;

  const PurposeAddEditAppBar({super.key, required this.isAdd});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => MaeumNavigator.pop(context),
                child: ImageWidget(
                  image: Images.arrowLeft,
                  width: 28.w,
                ),
              ),

              SizedBox(width: 24.w),

              MaeumText.labelLarge("목표 ${isAdd ? "추가" : "수정"}", MaeumColor.black),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(52.h);
}
