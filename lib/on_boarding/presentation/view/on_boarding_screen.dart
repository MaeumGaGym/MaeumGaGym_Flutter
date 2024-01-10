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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 150,
                height: MediaQuery.of(context).size.width - 150,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 30),
            PtdTextWidget.titleMedium('이제 헬창이 되어보세요!', MaeumgagymColor.black),
            const SizedBox(height: 10),
            PtdTextWidget.onBoardingSubTitle(
              '저희의 좋은 서비스를 통해 즐거운 헬창 생활을\n즐겨보세요!',
              MaeumgagymColor.gray600,
            ),
            const SizedBox(height: 68),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: onBoardingContentsData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: GestureDetector(
                    onTap: () => context.push(
                      onBoardingContentsData[index]['route']!,
                    ),
                    child: OnBoardingContentsWidget(
                      image: onBoardingContentsData[index]['image']!,
                      title: onBoardingContentsData[index]['title']!,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
