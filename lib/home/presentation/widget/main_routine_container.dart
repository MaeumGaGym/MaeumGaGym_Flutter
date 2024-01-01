import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/main_container_title.dart';

class MainRoutineContainer extends StatelessWidget {
  const MainRoutineContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, List<int>> routineData = {
      "벤치프레스": [10, 5],
      "크런치" : [10, 5],
      "싯업" : [10, 5],
    };
    return Container(
      decoration: BoxDecoration(
        color: MaeumgagymColor.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: MainContainerTitle(title: "오늘의 루틴"),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: routineData.length,
              itemBuilder: (context, index) {
                String key = routineData.keys.elementAt(index);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  color: MaeumgagymColor.gray100,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PtdTextWidget.titleSmall(
                                    key,
                                    MaeumgagymColor.black,
                                  ),
                                  const SizedBox(height: 2),
                                  PtdTextWidget.bodySmall(
                                    "${routineData[key]![0]}개 | ${routineData[key]![1]}세트",
                                    MaeumgagymColor.gray400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: SvgPicture.asset(
                              'assets/image/home_icon/right_arrow_icon.svg',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: index == routineData.length - 1 ? 0 : 8),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
