import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class AnimatedCheckButton extends ConsumerWidget {
  final bool onClicked, inText;
  final dynamic buttonProvider;

  const AnimatedCheckButton({
    required this.onClicked,
    required this.inText,
    required this.buttonProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => inText
          ? context.go('/signUpSuccess')
          : ref.read(buttonProvider.notifier).theError(true),
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
              : PtdTextWidget.labelLarge('회원가입',  MaeumgagymColor.gray200),
        ),
      ),
    );
  }
}
