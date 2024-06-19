import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class EmptyViewScreen extends StatelessWidget {
  const EmptyViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImageWidget(
              imageType: ImageType.svg,
              image: 'assets/image/core_icon/empty_view_icon.svg',
            ),
            const SizedBox(height: 24),
            PtdTextWidget.titleMedium('아직 개발중이에요', MaeumgagymColor.black),
            const SizedBox(height: 12),
            PtdTextWidget.bodyMedium('현재 탭은 개발중입니다.', MaeumgagymColor.gray500),
            PtdTextWidget.bodyMedium(
                '빠른 시일 내에 더욱 나은 모습으로 찾아뵙겠습니다.', MaeumgagymColor.gray500),
          ],
        ),
      ),
    );
  }
}
