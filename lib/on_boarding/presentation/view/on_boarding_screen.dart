import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/on_boarding/presentation/widget/on_boarding_contents_widget.dart';
import 'package:maeum_ga_gym_flutter/on_boarding/presentation/widget/on_boarding_data.dart';

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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: onBoardingContentsData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => context.push(
                    onBoardingContentsData[index]['route']!,
                  ),
                  child: OnBoardingContentsWidget(
                    image: onBoardingContentsData[index]['image']!,
                    title: onBoardingContentsData[index]['title']!,
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
