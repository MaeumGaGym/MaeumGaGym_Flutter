import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_text_field_provider.dart';

class SelfCareAnimatedButton extends ConsumerWidget {
  const SelfCareAnimatedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusState = ref.watch(selfCareTextFieldProvider);
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: focusState ? 0 : 20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: MediaQuery.of(context).size.width,
          height: 58,
          decoration: BoxDecoration(
            color: MaeumgagymColor.blue500,
            borderRadius: BorderRadius.circular(focusState ? 0 : 8),
          ),
          child: Center(
            child: PtdTextWidget.labelLarge(
              focusState ? "확인" : "수정 완료",
              MaeumgagymColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
