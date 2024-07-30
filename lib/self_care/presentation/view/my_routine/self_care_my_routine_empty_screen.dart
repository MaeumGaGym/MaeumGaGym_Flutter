import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/routine/presentation/widget/routine_default_title_widget.dart';

class SelfCareMyRoutineEmptyScreen extends StatelessWidget {
  const SelfCareMyRoutineEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RoutineDefaultTitleContainer(
            title: "내 루틴",
            subTitle: "나만의 루틴을 구성하여\n규칙적인 운동을 해보세요.",
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
                    image: Images.iconsNotDesignSysRoutineIcon,
                    imageWidth: 75,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              PtdTextWidget.titleMedium("아직 루틴이 없어요", MaeumgagymColor.gray600),
              const SizedBox(height: 12),
              PtdTextWidget.bodyMedium("루틴을 추가하여 규칙적으로 운동해 보세요.", MaeumgagymColor.gray500),
            ],
          ),
          const SizedBox(height: 96),
        ],
      ),
    );
  }
}
