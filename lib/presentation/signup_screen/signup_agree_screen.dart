/// Package
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// Core
import 'package:wewith_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:wewith_flutter/core/component/maeum_ga_gym_check_button.dart';
import 'package:wewith_flutter/core/constant/maeumgagym_color.dart';

/// widget
import 'package:wewith_flutter/presentation/signup_screen/widget/check_box_widget.dart';
import 'package:wewith_flutter/presentation/signup_screen/provider/provider/check_box_widget_provider.dart';

class SignUpAgreeScreen extends StatelessWidget {
  const SignUpAgreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var click = Provider.of<CheckBoxWidgetProvider>(context);

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
            PtdTextWidget.semiBold('약관동의', 36, MaeumGaGymColor.black)
                .padding(top: 32.h),

            /// 서비스 이용을 위해 필수 약관동의가 필요해요. 글자
            PtdTextWidget.regular(
                    '서비스 이용을 위해 필수 약관동의가 필요해요.', 16, MaeumGaGymColor.gray600)
                .padding(top: 8.h),

            /// 모두 동의해요. 위쪽 Divider
            Divider(height: 2.h, color: MaeumGaGymColor.gray50)
                .padding(top: 40.h),

            /// 모두 동의해요. 위젯
            SizedBox(
              width: double.infinity,
              height: 44.h,
              child: GestureDetector(
                onTap: () => click.clickAllCheck(),
                child: Row(
                  children: [
                    /// CheckBoxWidget ( allCheck )
                    CheckBoxWidget(state: click.allCheck),

                    /// 모두 동의해요. 글자
                    PtdTextWidget.medium('모두 동의해요.', 20, MaeumGaGymColor.black)
                        .padding(left: 12.w),
                  ],
                ),
              ),
            ).padding(top: 12.h, bottom: 12.h),

            /// 모두 동의해요. 아래쪽 Divider
            Divider(height: 2.h, color: MaeumGaGymColor.gray50),

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
                    onTap: () {
                      click.clickAgreePersonInformation();
                      click.checkAll();
                    },
                    child: Row(
                      children: [
                        CheckBoxWidget(state: click.agreePersonInformation),

                        /// 개인정보 수집 이용 동의 글자
                        PtdTextWidget.regular(
                                '개인정보 수집 이용 동의', 16, MaeumGaGymColor.black)
                            .padding(left: 12.w),
                      ],
                    ),
                  ),

                  /// 자세히 보기 ( agreePersonInformation )
                  PtdTextWidget.medium('자세히 보기', 14, MaeumGaGymColor.gray300)
                      .textStyle(TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: MaeumGaGymColor.gray300,
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
                    onTap: () {
                      click.clickAgreeConditionsOfUse();
                      click.checkAll();
                    },
                    child: Row(
                      children: [
                        CheckBoxWidget(state: click.agreeConditionsOfUse),

                        /// 이용 약관 동의 글자
                        PtdTextWidget.regular(
                                '이용 약관 동의', 16, MaeumGaGymColor.black)
                            .padding(left: 12.w),
                      ],
                    ),
                  ),

                  /// 자세히 보기 ( agreeConditionsOfUse )
                  PtdTextWidget.medium('자세히 보기', 14, MaeumGaGymColor.gray300)
                      .textStyle(TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: MaeumGaGymColor.gray300,
                  )),
                ],
              ),
            ).padding(top: 8.h, bottom: 8.h),

            /// 만 14세 이상 위젯
            SizedBox(
              width: double.infinity,
              height: 44.h,
              child: GestureDetector(
                onTap: () {
                  click.clickMoreThanAgeFourteen();
                  click.checkAll();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// CheckBoxWidget ( moreThanAgeFourteen )
                    CheckBoxWidget(state: click.moreThanAgeFourteen),

                    /// 만 14세 이상 글자
                    PtdTextWidget.regular('만 14세 이상', 16, MaeumGaGymColor.black)
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
                onTap: () {
                  click.clickAgreeMarketingInformation();
                  click.checkAll();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// CheckBoxWidget ( agreeMarketingInformation )
                    CheckBoxWidget(state: click.agreeMarketingInformation),

                    /// 마케팅 정보 수신 동의 글자
                    PtdTextWidget.regular(
                            '마케팅 정보 수신 동의 ', 16, MaeumGaGymColor.black)
                        .padding(left: 12.w),

                    PtdTextWidget.regular('(선택)', 16, MaeumGaGymColor.gray400),
                  ],
                ),
              ),
            ).padding(top: 8.h),
          ],
        ).padding(left: 20.w, right: 20.w),
      ),
      bottomSheet: click.agreePersonInformation &&
              click.agreeConditionsOfUse &&
              click.moreThanAgeFourteen
          ? MaeumGaGymCheckButton(
              isCircular: true,
              width: 390,
              height: 58,
              color: MaeumGaGymColor.blue500,
              notUseRoute: false,
              route: '/signupAgree/signupNickname',
              textWidget: PtdTextWidget.medium('확인', 20, MaeumGaGymColor.white),
            ).padding(bottom: 20.h)
          : MaeumGaGymCheckButton(
              isCircular: true,
              width: 390,
              height: 58,
              color: MaeumGaGymColor.gray400,
              notUseRoute: true,
              route: '',
              textWidget:
                  PtdTextWidget.medium('확인', 20, MaeumGaGymColor.gray200),
            ).padding(bottom: 20.h),
    );
  }
}
