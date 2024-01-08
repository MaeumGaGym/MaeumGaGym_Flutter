import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareMainTitleContainer extends StatelessWidget {
  const SelfCareMainTitleContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 공통 (같은 수치) 으로 들어가는 padding
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            // align 안넣어주면 svg 이미지 크기가 안 변하더라구용..
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MaeumgagymColor.blue50,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              "assets/image/self_care_icon/dumbel_icon.svg",
              width: 40,
              height: 40,
            ),
          ),
          Padding(
            // text 위젯 위 아래로 같은 수치으로 들어가는 padding
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: PtdTextWidget.titleLarge(
              "자기관리",
              MaeumgagymColor.black,
            ),
          ),
          PtdTextWidget.bodyMedium(
            "나만의 루틴과 목표를 설정하여\n자기관리에 도전해보세요.",
            MaeumgagymColor.gray600,
          ),
        ],
      ),
    );
  }
}
