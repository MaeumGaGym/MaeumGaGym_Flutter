import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeumgagym_button.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

import '../../config/maeumgagym_color.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/image/core_icon/logo.png',
              width: 102,
              height: 42,
            ),
          ).padding(bottom: 51),
          PtdTextWidget.titleLarge('회원가입 완료', MaeumgagymColor.black)
              .padding(bottom: 8),
          PtdTextWidget.labelMedium(
              '마음가짐의 회원이 되신 것을 축하드려요!', MaeumgagymColor.gray500),
        ],
      ),
      bottomSheet: SafeArea(
        child: MaeumgagymButton(
          text: '확인',
          fontSize: 20,
          fontColor: MaeumgagymColor.white,
          width: 390,
          height: 58,
          color: MaeumgagymColor.blue500,
          isCircular: true,
          route: '',
          isGo: true,
          useRoute: true,
        ).padding(left: 20, right: 20, bottom: 20),
      ),
    );
  }
}
