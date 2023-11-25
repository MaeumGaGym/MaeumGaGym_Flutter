/// Package
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/svg.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Core
import 'package:wewith_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:wewith_flutter/core/component/check_botton.dart';
import 'package:wewith_flutter/core/constant/maeumgagym_color.dart';

class SignUpNickNameScreen extends StatelessWidget {
  const SignUpNickNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 뒤로가기 버튼
            GestureDetector(
              onTap: () {
                context.go('/signupAgree');
              },
              child: SvgPicture.asset(
                'assets/image/left_arrow.svg',
                width: 24.w,
                height: 24.h,
              ),
            ).padding(top: 12.h),

            /// 닉네임 글자
            PtdTextWidget.semiBold('닉네임', 36, MaeumGaGymColor.black)
                .padding(top: 32.h),

            /// 서비스 이용을 위해 필수 약관동의가 필요해요. 글자
            PtdTextWidget.regular(
                    '자신만의 닉네임을 입력해 주세요', 16, MaeumGaGymColor.gray600)
                .padding(top: 8.h),
          ],
        ).padding(left: 20.w, right: 20.w),
      ),
    );
  }
}
