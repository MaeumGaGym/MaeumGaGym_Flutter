import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../component/maeum_button.dart';
import '../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_color.dart';

class PurposeAddButton extends StatelessWidget {
  final GestureTapCallback onTap;

  const PurposeAddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: MaeumButton(
        onTap: onTap,
        width: 1.sw - 40.w,
        height: 58.h,
        color: MaeumColor.blue500,
        borderRadius: 8.r,
        leading: ImageWidget(image: Images.editAdd, width: 24.w, color: MaeumColor.white),
        text: "목표 추가하기",
        fontColor: MaeumColor.white,
      ),
    );
  }
}