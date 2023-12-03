/// Package
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// Core
import 'package:wewith_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:wewith_flutter/core/constant/maeumgagym_color.dart';
import 'package:wewith_flutter/core/component/maeum_ga_gym_check_button.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Logo
            Center(
              child: Image.asset(
                'assets/image/logo.png',
                width: 102.w,
                height: 42.h,
              ),
            ).padding(bottom: 51.h),

            /// 회원가입 완료 글자
            Center(
              child:
                  PtdTextWidget.semiBold('회원가입 완료', 36, MaeumGaGymColor.black),
            ).padding(bottom: 8.h),

            /// 마음가짐의 회원이 되신것을 축하드려요! 글자
            Center(
              child: PtdTextWidget.medium(
                  '마음가짐의 회원이 되신것을 축하드려요!', 16, MaeumGaGymColor.gray500),
            ),
          ],
        ),
      ),
      bottomSheet: MaeumGaGymCheckButton(
        isCircular: true,
        width: 390,
        height: 58,
        color: MaeumGaGymColor.blue500,
        route: '',
        textWidget: PtdTextWidget.medium('확인', 20, MaeumGaGymColor.white),
        notUseRoute: true,
      ).padding(bottom: 20.h),
    );
  }
}
