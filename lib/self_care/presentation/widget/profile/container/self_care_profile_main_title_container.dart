import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareProfileMainTitleContainer extends StatelessWidget {
  const SelfCareProfileMainTitleContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PtdTextWidget.titleLarge(
          "내 프로필",
          MaeumgagymColor.black,
        ),
        const SizedBox(height: 12),
        PtdTextWidget.bodyMedium(
          "내 프로필을 관리해보세요.",
          MaeumgagymColor.gray600,
        ),
      ],
    );
  }
}
