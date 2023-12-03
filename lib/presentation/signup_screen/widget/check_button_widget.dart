/// Package
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';

/// Core
import 'package:wewith_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:wewith_flutter/core/constant/maeumgagym_color.dart';
import 'package:wewith_flutter/core/component/animated_check_button.dart';

class CheckButtonWidget extends StatelessWidget {
  final bool inText, clicked;

  const CheckButtonWidget(
      {required this.clicked, required this.inText, super.key});

  @override
  Widget build(BuildContext context) {
    if (inText) {
      return AnimatedCheckButton(
        state: clicked,
        isCircular: clicked ? false : true,
        firstWidth: 430,
        firstHeight: 58,
        secondWidth: 390,
        secondHeight: 58,
        color: MaeumGaGymColor.blue500,
        route: '/signupAgree/signupNickname/signupSuccess',
        textWidget: PtdTextWidget.medium('회원가입', 20, MaeumGaGymColor.white),
        notUseRoute: false,
        duration: 500,
        curves: Curves.fastOutSlowIn,
      ).padding(bottom: clicked ? 0.h : 20.h);
    } else {
      return AnimatedCheckButton(
        state: clicked,
        isCircular: clicked ? false : true,
        firstWidth: 430,
        firstHeight: 58,
        secondWidth: 390,
        secondHeight: 58,
        color: MaeumGaGymColor.gray400,
        route: '',
        textWidget: PtdTextWidget.medium('회원가입', 20, MaeumGaGymColor.white),
        notUseRoute: true,
        duration: 500,
        curves: Curves.fastOutSlowIn,
      ).padding(bottom: clicked ? 0.h : 20.h);
    }
  }
}
