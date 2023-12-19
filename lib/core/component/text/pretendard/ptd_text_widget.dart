import 'package:flutter/material.dart';

String pretendard = 'Pretendard';

class PtdTextWidget {
  static Text thin(String text, double fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize,
        fontWeight: FontWeight.w100,
        color: color,
      ),
    );
  }

  static Text extraLight(String text, double fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize,
        fontWeight: FontWeight.w200,
        color: color,
      ),
    );
  }

  static Text light(String text, double fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        color: color,
      ),
    );
  }

  static Text regular(String text, double fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }

  static Text medium(String text, double fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }

  static Text semiBold(String text, double fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  static Text bold(String text, double fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }

  static Text extraBold(String text, double fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }

  static Text black(String text, double fontSize, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: color,
      ),
    );
  }
}
