import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/component/maeumgagym_text_field.dart';
import '../../core/component/text/pretendard/ptd_text_widget.dart';

import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';

import 'package:maeum_ga_gym_flutter/sign_up/widget/animated_check_button.dart';
import 'package:maeum_ga_gym_flutter/sign_up/provider/nickname_text_field_riverpod.dart';

class SignUpNickNameScreen extends StatelessWidget {
  const SignUpNickNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nicknameController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// pop 버튼
            Consumer(
              builder: (context, ref, child) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                  child: GestureDetector(
                    onTap: () {
                      context.pop();
                      ref
                          .read(nicknameTextFieldProvider.notifier)
                          .clicked(false);
                      ref
                          .read(nicknameTextFieldProvider.notifier)
                          .isText(false);
                    },
                    child: SvgPicture.asset(
                      'assets/image/core_icon/left_arrow.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                );
              },
            ),

            /// 닉네임 글자
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
              child: PtdTextWidget.titleLarge('닉네임', MaeumgagymColor.black),
            ),

            /// 자신만의 닉네임을 입력해 주세요 글자
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: PtdTextWidget.bodyMedium(
                  '자신만의 닉네임을 입력해 주세요', MaeumgagymColor.gray600),
            ),

            /// 닉네임 TextField

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
              child: MaeumgagymTextField(
                controller: nicknameController,
                text: '닉네임',
                errorText: '이미 사용중인 닉네임이에요.',
                textFieldProvider: nicknameTextFieldProvider,
              ),
            )
          ],
        ),
      ),
      bottomSheet: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            return AnimatedCheckButton(
              inText: ref.watch(nicknameTextFieldProvider).inText,
              onClicked: ref.watch(nicknameTextFieldProvider).onClicked,
              buttonProvider: nicknameTextFieldProvider,
            );
          },
        ),
      ),
    );
  }
}

class MaeumGaGymColor {}
