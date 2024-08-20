import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String pretendard = 'Pretendard';

class MaeumText {
  static Text labelSmall(
    String text,
    Color color,
    TextDecoration? textDecoration,
    Color? textDecorationColor,
  ) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: color,
        decoration: textDecoration,
        decorationColor: textDecorationColor,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text labelMedium(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text labelLarge(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text bodyTiny(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text bodySmall(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text bodyMedium(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text bodyLarge(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text titleSmall(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text titleMedium(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text titleLarge(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 36.sp,
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text headLineSmall(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 40.sp,
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text headLineMedium(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 48.sp,
        fontWeight: FontWeight.w700,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text headLineLarge(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 64.sp,
        fontWeight: FontWeight.w800,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text clauseTitle(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text clauseSubTitle(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text onBoardingSubTitle(String text, Color color) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text onTimerAndMetronomeTitle(String text, Color color) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.sp,
        fontFamily: pretendard,
        fontSize: 64.sp,
        fontWeight: FontWeight.w300,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text timerListTitle(String text, Color color) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text metronomeBeat(String text, Color color) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 32.sp,
        fontWeight: FontWeight.w300,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text timerPickerNumber(String text, Color color) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 64.sp,
        fontWeight: FontWeight.w300,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text metronomeSettingTitle(String text, Color color) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }

  static Text bottomNavigationText(String text, Color color) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: color,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
