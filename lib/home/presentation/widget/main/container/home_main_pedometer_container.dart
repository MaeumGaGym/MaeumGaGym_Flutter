import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/view/home_pedometer_detail_screen.dart';

class HomeMainWalkContainer extends StatefulWidget {
  // final String steps; // 걸음 수
  const HomeMainWalkContainer({super.key});

  @override
  State<HomeMainWalkContainer> createState() => _HomeMainWalkContainerState();
}

class _HomeMainWalkContainerState extends State<HomeMainWalkContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomeWalkDetailScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: MaeumgagymColor.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  PtdTextWidget.titleLarge(
                    "2,771", // 변경될 값
                    MaeumgagymColor.blue500,
                  ),
                  const SizedBox(width: 12),
                  PtdTextWidget.titleSmall(
                    "걸음",
                    MaeumgagymColor.gray600,
                  ),
                ],
              ),
              GestureDetector(
                child: ImageWidget(
                  image: Images.chevronRight,
                  width: 24,
                  height: 24,
                  color: MaeumgagymColor.gray200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
