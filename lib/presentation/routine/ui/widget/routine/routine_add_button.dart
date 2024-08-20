import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/image_widget.dart';
import 'package:maeumgagym_flutter/component/maeum_button.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';

class RoutineAddButton extends StatelessWidget {
  final GestureTapCallback onTap;

  const RoutineAddButton({super.key, required this.onTap});

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
        text: "루틴 추가하기",
        fontColor: MaeumColor.white,
      ),
    );
  }
}
