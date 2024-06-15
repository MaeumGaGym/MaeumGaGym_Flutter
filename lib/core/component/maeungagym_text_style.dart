import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class MaeumGaGymTextStyle {
  static TextStyle bodyMedium(Color color) {
    return TextStyle(
      fontFamily: pretendard,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color,
      overflow: TextOverflow.visible,
      decorationThickness: 0,
    );
  }

  static TextStyle bodyLarge(Color color) {
    return TextStyle(
      fontFamily: pretendard,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: color,
      overflow: TextOverflow.visible,
      decorationThickness: 0,
    );
  }

  static TextStyle labelMedium(Color color) {
    return TextStyle(
      fontFamily: pretendard,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
      overflow: TextOverflow.visible,
      decorationThickness: 0,
    );
  }
}