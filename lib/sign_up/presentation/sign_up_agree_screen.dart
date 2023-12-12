/// Package
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Core
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import '../../core/component/text/pretendard/ptd_text_widget.dart';

/// widget
import '../widget/check_box_widget.dart';

class SignUpAgreeScreen extends StatelessWidget {
  const SignUpAgreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 뒤로가기 버튼
            GestureDetector(
              onTap: () {
                context.go('/');
              },
              child: SvgPicture.asset(
                'assets/image/left_arrow.svg',
                width: 24.w,
                height: 24.h,
              ),
            ).padding(top: 12.h),

            /// 약관 동의 글자
            PtdTextWidget.semiBold('약관동의', 36, MaeumgagymColor.black)
                .padding(top: 32.h),

            /// 서비스 이용을 위해 필수 약관동의가 필요해요. 글자
            PtdTextWidget.regular(
                    '서비스 이용을 위해 필수 약관동의가 필요해요.', 16, MaeumgagymColor.gray600)
                .padding(top: 8.h),

            /// 모두 동의해요. 위쪽 Divider
            Divider(height: 2.h, color: MaeumgagymColor.gray50)
                .padding(top: 40.h),

            /// 모두 동의해요. 위젯
            SizedBox(
              width: double.infinity,
              height: 44.h,
              child: GestureDetector(
                child: Row(
                  children: [
                    /// CheckBoxWidget ( allCheck )
                    CheckBoxWidget(state: true),

                    /// 모두 동의해요. 글자
                    PtdTextWidget.medium('모두 동의해요.', 20, MaeumgagymColor.black)
                        .padding(left: 12.w),
                  ],
                ),
              ),
            ).padding(top: 12.h, bottom: 12.h),

            /// 모두 동의해요. 아래쪽 Divider
            Divider(height: 2.h, color: MaeumgagymColor.gray50),

            /// 개인정보 수집 이용 동의 위젯
            SizedBox(
              width: double.infinity,
              height: 44.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// CheckBoxWidget ( agreePersonInformation )
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        CheckBoxWidget(state: true),

                        /// 개인정보 수집 이용 동의 글자
                        PtdTextWidget.regular(
                                '개인정보 수집 이용 동의', 16, MaeumgagymColor.black)
                            .padding(left: 12.w),
                      ],
                    ),
                  ),

                  /// 자세히 보기 ( agreePersonInformation )
                  PtdTextWidget.medium('자세히 보기', 14, MaeumgagymColor.gray300)
                      .textStyle(TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: MaeumgagymColor.gray300,
                  )),
                ],
              ),
            ).padding(top: 12.h, bottom: 8.h),

            /// 이용 약관 동의 위젯
            SizedBox(
              width: double.infinity,
              height: 44.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// CheckBoxWidget ( agreeConditionsOfUse )
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        CheckBoxWidget(state: true),

                        /// 이용 약관 동의 글자
                        PtdTextWidget.regular(
                                '이용 약관 동의', 16, MaeumgagymColor.black)
                            .padding(left: 12.w),
                      ],
                    ),
                  ),

                  /// 자세히 보기 ( agreeConditionsOfUse )
                  PtdTextWidget.medium('자세히 보기', 14, MaeumgagymColor.gray300)
                      .textStyle(TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: MaeumgagymColor.gray300,
                  )),
                ],
              ),
            ).padding(top: 8.h, bottom: 8.h),

            /// 만 14세 이상 위젯
            SizedBox(
              width: double.infinity,
              height: 44.h,
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// CheckBoxWidget ( moreThanAgeFourteen )
                    CheckBoxWidget(state: true),

                    /// 만 14세 이상 글자
                    PtdTextWidget.regular('만 14세 이상', 16, MaeumgagymColor.black)
                        .padding(left: 12.w),
                  ],
                ),
              ),
            ).padding(top: 8.h, bottom: 8.h),

            /// 마케팅 정보 수신 동의 위젯
            SizedBox(
              width: double.infinity,
              height: 44.h,
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// CheckBoxWidget ( agreeMarketingInformation )
                    CheckBoxWidget(state: true),

                    /// 마케팅 정보 수신 동의 글자
                    PtdTextWidget.regular(
                            '마케팅 정보 수신 동의 ', 16, MaeumgagymColor.black)
                        .padding(left: 12.w),

                    PtdTextWidget.regular('(선택)', 16, MaeumgagymColor.gray400),
                  ],
                ),
              ),
            ).padding(top: 8.h),
          ],
        ).padding(left: 20.w, right: 20.w),
      ),
    );
  }
}
