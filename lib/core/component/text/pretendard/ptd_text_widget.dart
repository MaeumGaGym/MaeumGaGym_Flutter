import 'package:flutter/material.dart';

String pretendard = 'Pretendard';

class PtdTextWidget {
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
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
        decoration: textDecoration,
        decorationColor: textDecorationColor,
      ),
    );
  }

  static Text labelMedium(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }

  static Text labelLarge(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }

  static Text bodyTiny(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }

  static Text bodySmall(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }

  static Text bodyMedium(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }

  static Text bodyLarge(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }

  static Text titleSmall(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  static Text titleMedium(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  static Text titleLarge(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  static Text headLineSmall(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 40,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  static Text headLineMedium(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }

  static Text headLineLarge(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: pretendard,
        fontSize: 64,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }
}
