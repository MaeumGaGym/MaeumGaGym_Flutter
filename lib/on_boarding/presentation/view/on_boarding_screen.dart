import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';

import '../../../core/component/text/pretendard/ptd_text_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 64),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 110,
                height: MediaQuery.of(context).size.width - 110,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 32),
            PtdTextWidget.titleMedium('이제 헬창이 되어보세요!', Colors.black),
            const SizedBox(height: 12),
            PtdTextWidget.onBoardingSubTitle(
              '저희의 좋은 서비스를 통해 즐거운 헬창 생활을\n즐겨보세요!',
              MaeumgagymColor.gray600,
            ),
            const SizedBox(height: 105),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: GestureDetector(
                onTap: () => context.push('/signUpAgree'),
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MaeumgagymColor.gray50,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                            'assets/image/on_boarding_icon/google_logo.svg'),
                        PtdTextWidget.labelMedium('구글로 로그인', Colors.black),
                        const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: GestureDetector(
                onTap: () => context.push('/signUpAgree'),
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MaeumgagymColor.gray50,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                            'assets/image/on_boarding_icon/kakao_talk_logo.svg'),
                        PtdTextWidget.labelMedium('카카오로 로그인', Colors.black),
                        const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 28),
              child: GestureDetector(
                onTap: () => context.push('/signUpAgree'),
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MaeumgagymColor.gray50,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                            'assets/image/on_boarding_icon/apple_logo.svg'),
                        PtdTextWidget.labelMedium('Apple로 로그인', Colors.black),
                        const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
