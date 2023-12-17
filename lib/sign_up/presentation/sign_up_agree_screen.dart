/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeumgagym_button.dart';
import 'package:styled_widget/styled_widget.dart';

/// Core
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import '../../core/component/text/pretendard/ptd_text_widget.dart';

/// widget
import '../widget/check_box_widget.dart';
import '../provider/check_box_state_provider.dart';

class SignUpAgreeScreen extends ConsumerWidget {
  const SignUpAgreeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(checkBoxProvider);

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
                width: 24,
                height: 24,
              ),
            ).padding(top: 12),

            /// 약관 동의 글자
            PtdTextWidget.semiBold('약관동의', 36, MaeumgagymColor.black)
                .padding(top: 32),

            /// 서비스 이용을 위해 필수 약관동의가 필요해요. 글자
            PtdTextWidget.regular(
                    '서비스 이용을 위해 필수 약관동의가 필요해요.', 16, MaeumgagymColor.gray600)
                .padding(top: 8),

            /// 모두 동의해요. 위쪽 Divider
            Divider(height: 2, color: MaeumgagymColor.gray50).padding(top: 40),

            /// 모두 동의해요. 위젯
            SizedBox(
              width: double.infinity,
              height: 44,
              child: GestureDetector(
                onTap: () =>
                    ref.read(checkBoxProvider.notifier).clickAllAgree(),
                child: Row(
                  children: [
                    /// CheckBoxWidget ( allCheck )
                    CheckBoxWidget(state: state.allAgree),

                    /// 모두 동의해요. 글자
                    PtdTextWidget.medium('모두 동의해요.', 20, MaeumgagymColor.black)
                        .padding(left: 12),
                  ],
                ),
              ),
            ).padding(top: 12, bottom: 12),

            /// 모두 동의해요. 아래쪽 Divider
            Divider(height: 2, color: MaeumgagymColor.gray50),

            /// 개인정보 수집 이용 동의 위젯
            SizedBox(
              width: double.infinity,
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// CheckBoxWidget ( agreePersonInformation )
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(checkBoxProvider.notifier)
                          .clickAgreePersonInformation();
                      ref.read(checkBoxProvider.notifier).checkAllAgree();
                    },
                    child: Row(
                      children: [
                        CheckBoxWidget(state: state.agreePersonInformation),

                        /// 개인정보 수집 이용 동의 글자
                        PtdTextWidget.regular(
                                '개인정보 수집 이용 동의', 16, MaeumgagymColor.black)
                            .padding(left: 12),
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
            ).padding(top: 12, bottom: 8),

            /// 이용 약관 동의 위젯
            SizedBox(
              width: double.infinity,
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// CheckBoxWidget ( agreeConditionsOfUse )
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(checkBoxProvider.notifier)
                          .clickAgreeConditionsOfUse();
                      ref.read(checkBoxProvider.notifier).checkAllAgree();
                    },
                    child: Row(
                      children: [
                        CheckBoxWidget(state: state.agreeConditionsOfUse),

                        /// 이용 약관 동의 글자
                        PtdTextWidget.regular(
                                '이용 약관 동의', 16, MaeumgagymColor.black)
                            .padding(left: 12),
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
            ).padding(top: 8, bottom: 8),

            /// 만 14세 이상 위젯
            SizedBox(
              width: double.infinity,
              height: 44,
              child: GestureDetector(
                onTap: () {
                  ref
                      .read(checkBoxProvider.notifier)
                      .clickMoreThanAgeFourteen();
                  ref.read(checkBoxProvider.notifier).checkAllAgree();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// CheckBoxWidget ( moreThanAgeFourteen )
                    CheckBoxWidget(state: state.moreThanAgeFourteen),

                    /// 만 14세 이상 글자
                    PtdTextWidget.regular('만 14세 이상', 16, MaeumgagymColor.black)
                        .padding(left: 12),
                  ],
                ),
              ),
            ).padding(top: 8, bottom: 8),

            /// 마케팅 정보 수신 동의 위젯
            SizedBox(
              width: double.infinity,
              height: 44,
              child: GestureDetector(
                onTap: () {
                  ref
                      .read(checkBoxProvider.notifier)
                      .clickAgreeMarketingInformation();
                  ref.read(checkBoxProvider.notifier).checkAllAgree();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// CheckBoxWidget ( agreeMarketingInformation )
                    CheckBoxWidget(state: state.agreeMarketingInformation),

                    /// 마케팅 정보 수신 동의 글자
                    PtdTextWidget.regular(
                            '마케팅 정보 수신 동의 ', 16, MaeumgagymColor.black)
                        .padding(left: 12),

                    PtdTextWidget.regular('(선택)', 16, MaeumgagymColor.gray400),
                  ],
                ),
              ),
            ).padding(top: 8),
            const Spacer(),
            state.agreePersonInformation &&
                    state.agreeConditionsOfUse &&
                    state.moreThanAgeFourteen
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: MaeumgagymButton(
                      text: '확인',
                      fontSize: 20,
                      fontColor: MaeumgagymColor.white,
                      width: 390,
                      height: 58,
                      color: MaeumgagymColor.blue500,
                      isCircular: true,
                      isRoute: context.push(''),
                      useRoute: true,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: MaeumgagymButton(
                      text: '확인',
                      fontSize: 20,
                      fontColor: MaeumgagymColor.gray200,
                      width: 390,
                      height: 58,
                      color: MaeumgagymColor.gray400,
                      isCircular: true,
                      isRoute: context.push(''),
                      useRoute: false,
                    ),
                  ),
          ],
        ).padding(left: 20, right: 20),
      ),
    );
  }
}
