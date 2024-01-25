import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_text_field_provider.dart';

class SelfCareAnimatedButton extends ConsumerWidget {
  final String buttonTitle;
  final String buttonAnimatedTitle;

  const SelfCareAnimatedButton({
    super.key,
    required this.buttonTitle,
    required this.buttonAnimatedTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusState = ref.watch(selfCareTextFieldProvider);

    /// textfield 클래스에서 변경해주던 그 provider
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: focusState ? 0 : 20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),

          /// signup 버튼 가져와서 좀 많이 수정함
          width: MediaQuery.of(context).size.width,
          height: 58,
          decoration: BoxDecoration(
            color: MaeumgagymColor.blue500,
            borderRadius: BorderRadius.circular(focusState ? 0 : 8),
          ),
          child: Center(
            child: PtdTextWidget.labelLarge(
              focusState ? buttonAnimatedTitle : buttonTitle,
              MaeumgagymColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
