import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String pretendard = 'Pretendard';

class PtdTextWidget {
  static Text thin(String text, num fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w100,
        color: color,
      ),
    );
  }

  static Text extraLight(String text, num fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w200,
        color: color,
      ),
    );
  }

  static Text light(String text, num fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w300,
        color: color,
      ),
    );
  }

  static Text regular(String text, num fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }

  static Text medium(String text, num fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }

  static Text semiBold(String text, num fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  static Text bold(String text, num fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }

  static Text extraBold(String text, num fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }

  static Text black(String text, num fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.w900,
        color: color,
      ),
    );
  }
}
