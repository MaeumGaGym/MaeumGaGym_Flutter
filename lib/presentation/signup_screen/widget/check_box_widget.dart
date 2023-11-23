import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool state;

  const CheckBoxWidget({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    if (state == true) {
      return SvgPicture.asset(
        'assets/image/check_box.svg',
        width: 28.w,
        height: 28.h,
      );
    } else {
      return SvgPicture.asset(
        'assets/image/empty_check_box.svg',
        width: 28.w,
        height: 28.h,
      );
    }
  }
}
