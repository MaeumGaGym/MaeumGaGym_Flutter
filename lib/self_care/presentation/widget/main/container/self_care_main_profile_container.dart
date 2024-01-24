import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/profile/self_care_profile_main_screen.dart';

class SelfCareMainProfileContainer extends StatelessWidget {
  const SelfCareMainProfileContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SelfCareProfileMainScreen(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container( // 임시로 준 프로필 사진 (검은색으로 표시됩니당)
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: MaeumgagymColor.black,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        PtdTextWidget.labelLarge(
                          "김현석", // 임시 값
                          MaeumgagymColor.black,
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          "assets/image/self_care_icon/profile_icon.svg", // 이름 옆에 회오리 마냥 들어가는 아이콘
                          height: 16,
                          width: 16,
                        )
                      ],
                    ),
                    const SizedBox(height: 2),
                    PtdTextWidget.bodyMedium(
                      "124시간", // 임시 값
                      MaeumgagymColor.gray400,
                    ),
                  ],
                ),
              ],
            ),
            SvgPicture.asset(
              "assets/image/core_icon/right_arrow_icon.svg",
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
