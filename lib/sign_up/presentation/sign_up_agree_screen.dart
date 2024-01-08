// ignore_for_file: no_leading_underscores_for_local_identifiers

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

    Future _displayBottomSheet(BuildContext context) async {
      return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0),
          ),
        ),
        builder: (context) {
          return Wrap(
            children: [
              /// 이용 약관
              SizedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  PtdTextWidget.bodyLarge('이용약관', MaeumgagymColor.black),
                  Image.asset('assets/image/core_icon/close.png',
                      width: 12, height: 12)
                ],
              )).padding(left: 20, right: 20, top: 16, bottom: 16),
            ],
          );
        },
      );
    }

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
                'assets/image/core_icon/left_arrow_icon.svg',
                width: 24,
                height: 24,
              ),
            ).padding(top: 12),

            /// 약관 동의 글자
            PtdTextWidget.titleLarge('약관동의',  MaeumgagymColor.black)
                .padding(top: 32),

            /// 서비스 이용을 위해 필수 약관동의가 필요해요. 글자
            PtdTextWidget.bodyMedium(
                    '서비스 이용을 위해 필수 약관동의가 필요해요.', MaeumgagymColor.gray600)
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
                    PtdTextWidget.labelLarge('모두 동의해요.',  MaeumgagymColor.black)
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
                        PtdTextWidget.bodyMedium(
                                '개인정보 수집 이용 동의',MaeumgagymColor.black)
                            .padding(left: 12),
                      ],
                    ),
                  ),

                  /// 자세히 보기 ( agreePersonInformation )
                  GestureDetector(
                    onTap: () {
                      _displayBottomSheet(context);
                    },
                    child: PtdTextWidget.labelSmall(
                            '자세히 보기', MaeumgagymColor.gray300)
                        .textStyle(TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: MaeumgagymColor.gray300,
                    )),
                  ),
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
                        PtdTextWidget.bodyMedium(
                                '이용 약관 동의',  MaeumgagymColor.black)
                            .padding(left: 12),
                      ],
                    ),
                  ),

                  /// 자세히 보기 ( agreeConditionsOfUse )
                  PtdTextWidget.labelSmall('자세히 보기', MaeumgagymColor.gray300)
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
                    PtdTextWidget.bodyMedium('만 14세 이상',  MaeumgagymColor.black)
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
                    PtdTextWidget.bodyMedium(
                            '마케팅 정보 수신 동의 ', MaeumgagymColor.black)
                        .padding(left: 12),

                    PtdTextWidget.bodyMedium('(선택)', MaeumgagymColor.gray400),
                  ],
                ),
              ),
            ).padding(top: 8),
            const Spacer(),
            state.agreePersonInformation &&
                    state.agreeConditionsOfUse &&
                    state.moreThanAgeFourteen
                ? MaeumgagymButton(
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
                  ).padding(bottom: 20)
                : MaeumgagymButton(
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
                  ).padding(bottom: 20),
          ],
        ).padding(left: 20, right: 20),
      ),
    );
  }
}
