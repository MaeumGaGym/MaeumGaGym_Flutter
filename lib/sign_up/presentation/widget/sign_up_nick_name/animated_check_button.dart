import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

import '../../../../core/di/login_option_di.dart';
import '../../provider/maeumgagym_sign_up_provider.dart';
import '../../provider/nickname_check_provider.dart';
import '../../provider/nickname_text_field_riverpod.dart';
import '../../provider/social_login_provider.dart';

class AnimatedCheckButton extends ConsumerWidget {
  final bool onClicked, inText;
  final StateNotifierProvider<TextFieldStateNotifier, TextFieldState>
      buttonProvider;
  final TextEditingController textController;

  const AnimatedCheckButton({
    required this.onClicked,
    required this.inText,
    required this.buttonProvider,
    required this.textController,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        /// 현재 닉네임에 적힌 이름
        String name = textController.text;

        /// 닉네임 검사
        await ref.read(nicknameCheckController.notifier).checkNickname(name);

        ref.watch(nicknameCheckController).when(
              data: (data) async {
                if (data) {
                  ref.read(buttonProvider.notifier).theError(false);

                  /// 구글이면 구글 회원가입
                  switch (ref.watch(loginOptionController)) {
                    case LoginOption.google:
                      await ref
                          .read(maeumgagymSignUpController.notifier)
                          .googleSignUp(
                            ref.watch(socialLoginController).token!,
                            name,
                          );
                      break;
                    case LoginOption.kakao:
                      await ref
                          .read(maeumgagymSignUpController.notifier)
                          .kakaoSignUp(
                            ref.watch(socialLoginController).token!,
                            name,
                          );
                    case LoginOption.all:
                      break;
                  }
                  ref.watch(maeumgagymSignUpController).when(
                        data: (data) {
                          context.go('/signUpSuccess');
                        },
                        error: (_, __) {},
                        loading: () {},
                      );
                } else {
                  ref.read(buttonProvider.notifier).theError(true);
                }
              },
              error: (_, __) {},
              loading: () {},
            );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: onClicked ? 430 : 390,
        height: 58,
        margin: EdgeInsets.fromLTRB(
            onClicked ? 0 : 20, 0, onClicked ? 0 : 20, onClicked ? 0 : 20),
        decoration: BoxDecoration(
          color: inText ? MaeumgagymColor.blue500 : MaeumgagymColor.gray400,
          borderRadius: BorderRadius.circular(onClicked ? 0 : 8),
        ),
        child: Builder(
          builder: (context) {
            if (ref.watch(nicknameCheckController).hasValue &&
                ref.watch(maeumgagymSignUpController).hasValue) {
              return Center(
                child: inText
                    ? PtdTextWidget.labelLarge('회원가입', MaeumgagymColor.white)
                    : PtdTextWidget.labelLarge('회원가입', MaeumgagymColor.gray200),
              );
            } else if (ref.watch(nicknameCheckController).hasError &&
                ref.watch(maeumgagymSignUpController).hasError) {
              throw Exception('회원가입 Error');
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: MaeumgagymColor.white,
              ));
            }
          },
        ),
      ),
    );
  }
}
