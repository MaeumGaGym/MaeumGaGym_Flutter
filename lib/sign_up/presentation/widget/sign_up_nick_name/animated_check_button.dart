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
    final maeumgagymSignUpNotifier =
        ref.read(maeumgagymSignUpController.notifier);
    final nicknameErrorControllerNotifier =
        ref.read(nicknameErrorController.notifier);

    return GestureDetector(
      onTap: () async {
        if (inText) {
          /// 현재 닉네임에 적힌 이름
          String name = textController.text;

          if (name.length < 2 || name.length > 10 || name.contains(' ')) {
            nicknameErrorControllerNotifier.state =
                '닉네임은 2~10자로 공백을 포함할 수 없어요.';

            ref.read(buttonProvider.notifier).theError(true);
            return;
          }

          /// 닉네임 검사
          await ref.read(nicknameCheckController.notifier).checkNickname(name);

          if (ref.read(nicknameCheckController).value!) {
            ref.read(buttonProvider.notifier).theError(false);

            /// 구글이면 구글 회원가입
            switch (ref.watch(loginOptionController)) {
              case LoginOption.google:
                await maeumgagymSignUpNotifier.googleSignUp(
                  ref.watch(socialLoginController).token!,
                  name,
                );
                break;
              case LoginOption.kakao:
                await maeumgagymSignUpNotifier.kakaoSignUp(
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
                  error: (err, __) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Maeumgagym SignUp Error"),
                          content: Text(err.toString()),
                          actions: [
                            MaterialButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("확인"),
                            )
                          ],
                        );
                      },
                    );
                  },
                  loading: () {},
                );
          } else {
            nicknameErrorControllerNotifier.state = '이미 사용중인 닉네임이에요.';

            ref.read(buttonProvider.notifier).theError(true);
          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: onClicked
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width - 40,
        height: 58,
        margin: EdgeInsets.fromLTRB(
            onClicked ? 0 : 20, 0, onClicked ? 0 : 20, onClicked ? 0 : 20),
        decoration: BoxDecoration(
          color: inText ? MaeumgagymColor.blue500 : MaeumgagymColor.gray400,
          borderRadius: BorderRadius.circular(onClicked ? 0 : 8),
        ),
        child: Center(
          child: inText
              ? PtdTextWidget.labelLarge('회원가입', MaeumgagymColor.white)
              : PtdTextWidget.labelLarge('회원가입', MaeumgagymColor.gray200),
        ),
      ),
    );
  }
}
