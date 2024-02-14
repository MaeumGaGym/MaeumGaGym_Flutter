// ignore_for_file: no_leading_underscores_for_local_identifiers

/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeumgagym_button.dart';

/// Core
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import '../../../core/component/text/pretendard/ptd_text_widget.dart';

/// widget
import '../provider/check_box_state_provider.dart';
import '../widget/sign_up_agree/check_box_widget.dart';
import '../widget/sign_up_agree/read_more_widget.dart';

class SignUpAgreeScreen extends ConsumerWidget {
  const SignUpAgreeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkBoxProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 뒤로가기 버튼
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    'assets/image/core_icon/left_arrow_icon.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),

              /// 약관 동의 글자
              const SizedBox(height: 32),
              PtdTextWidget.titleLarge('약관동의', MaeumgagymColor.black),

              /// 서비스 이용을 위해 필수 약관동의가 필요해요. 글자
              const SizedBox(height: 8),
              PtdTextWidget.bodyMedium(
                  '서비스 이용을 위해 필수 약관동의가 필요해요.', MaeumgagymColor.gray600),

              /// 모두 동의해요. 위쪽 Divider
              const SizedBox(height: 40),
              Divider(height: 2, color: MaeumgagymColor.gray50),

              /// 모두 동의해요. 위젯
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SizedBox(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: PtdTextWidget.labelLarge(
                              '모두 동의해요.', MaeumgagymColor.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              /// 모두 동의해요. 아래쪽 Divider
              Divider(height: 2, color: MaeumgagymColor.gray50),

              /// 개인정보 수집 이용 동의 위젯
              /// .padding(top: 12, bottom: 8),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 8),
                child: SizedBox(
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
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: PtdTextWidget.bodyMedium(
                                  '개인정보 수집 이용 동의', MaeumgagymColor.black),
                            )
                          ],
                        ),
                      ),

                      /// 자세히 보기 ( agreePersonInformation )
                      GestureDetector(
                        onTap: () {
                          readMoreWidget(context);
                        },
                        child: PtdTextWidget.labelSmall(
                          '자세히 보기',
                          MaeumgagymColor.gray300,
                          TextDecoration.underline,
                          MaeumgagymColor.gray300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// 이용 약관 동의 위젯
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
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
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: PtdTextWidget.bodyMedium(
                                  '이용 약관 동의', MaeumgagymColor.black),
                            )
                          ],
                        ),
                      ),

                      /// 자세히 보기 ( agreeConditionsOfUse )
                      PtdTextWidget.labelSmall(
                        '자세히 보기',
                        MaeumgagymColor.gray300,
                        TextDecoration.underline,
                        MaeumgagymColor.gray300,
                      ),
                    ],
                  ),
                ),
              ),

              /// 만 14세 이상 위젯
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: PtdTextWidget.bodyMedium(
                              '만 14세 이상', MaeumgagymColor.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              /// 마케팅 정보 수신 동의 위젯
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: PtdTextWidget.bodyMedium(
                              '마케팅 정보 수신 동의 ', MaeumgagymColor.black),
                        ),

                        PtdTextWidget.bodyMedium(
                            '(선택)', MaeumgagymColor.gray400),
                      ],
                    ),
                  ),
                ),
              ),
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
                        route: '/signUpNickName',
                        isGo: false,
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
                        route: '',
                        isGo: false,
                        useRoute: false,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
