import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/maeum_button.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';

class PurposeAddEditButton extends StatelessWidget {
  final GestureTapCallback onTap;

  const PurposeAddEditButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaeumButton(
      onTap: onTap,
      width: 1.sw - 40.w,
      height: 58.h,
      color: MaeumColor.blue500,
      borderRadius: 8.r,
      text: "확인",
      fontColor: MaeumColor.white,
    );
  }
}
