import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

import '../../../../core/component/routine/presentation/widget/routine_default_title_widget.dart';

class SelfCarePurposeEmptyScreen extends StatelessWidget {
  const SelfCarePurposeEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RoutineDefaultTitleContainer(
            title: "목표",
            subTitle: "나만의 목표를 세워보세요.",
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: MaeumgagymColor.gray50,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const ImageWidget(
                    image: Images.iconsNotDesignSysTargetIcon,
                    imageWidth: 96,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              PtdTextWidget.titleMedium("아직 목표가 없어요", MaeumgagymColor.gray600),
              const SizedBox(height: 12),
              PtdTextWidget.bodyMedium("목표를 추가하고 목표를 향해 달려보세요.", MaeumgagymColor.gray500),
            ],
          ),
          const SizedBox(height: 96),
        ],
      ),
    );
  }
}
