import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import '../core/maeum/maeum_text.dart';

class MaeumToastMessage extends StatelessWidget {
  final String title;
  final bool isError;

  const MaeumToastMessage({super.key, required this.title, this.isError = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Builder(
        builder: (_) {
          if(!isError){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              width: 1.sw,
              decoration: BoxDecoration(
                color: MaeumColor.gray100,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: MaeumText.labelMedium(title, MaeumColor.black),
            );
          } else {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              width: 1.sw,
              decoration: BoxDecoration(
                color: MaeumColor.red50,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: MaeumText.labelMedium(title, MaeumColor.red500),
            );
          }
        },
      ),
    );
  }
}
