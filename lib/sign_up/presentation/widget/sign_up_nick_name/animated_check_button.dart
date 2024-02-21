import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/core/riverpod/maeumgagym_text_field_riverpod.dart';

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
        inText
            ? context.go('/signUpSuccess')
            : ref.read(buttonProvider.notifier).theError(true);

        /// 현재 닉네임에 적힌 이름
        // String name = textController.text;
        //
        /// 닉네임 검사
        // await ref.read(nicknameCheckController.notifier).checkNickname(name);
        //
        /// 닉네임이 중복되지 않다면
        // if (ref.watch(nicknameCheckController).notDuplicating) {
        /// 에러메시지 없애고
        //   ref.read(buttonProvider.notifier).theError(false);
        /// scrfToken 발급
        //   await ref.read(csrfTokenController.notifier).getSCRFToken();
        //
        /// 구글이면 구글 회원가입
        //   if (ref.read(socialLoginController).isGoogle) {
        //     await ref.read(maeumgagymSignUpController.notifier).googleSignUp(
        //           ref.watch(socialLoginController).token,
        //           ref.watch(csrfTokenController).xsrfToken,
        //           name,
        //         );
        /// 아니면 카카오 회원가입
        //   } else {
        //     await ref.read(maeumgagymSignUpController.notifier).kakaoSignUp(
        //           ref.watch(socialLoginController).token,
        //           ref.watch(csrfTokenController).xsrfToken,
        //           name,
        //         );
        //   }
        /// 닉네임이 중복 된다면
        // } else {
        //   ref.read(buttonProvider.notifier).theError(true);
        // }
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
        child: Center(
          child: inText
              ? PtdTextWidget.labelLarge('회원가입', MaeumgagymColor.white)
              : PtdTextWidget.labelLarge('회원가입', MaeumgagymColor.gray200),
        ),
      ),
    );
  }
}
