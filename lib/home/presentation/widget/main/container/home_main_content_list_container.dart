import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class HomeMainContentListContainer extends StatelessWidget {
  const HomeMainContentListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, List<String>> contentsData = {
      "칼로리 계산기": ["assets/image/home_icon/calculate_icon.svg", "먹은 음식의 칼로리를\n계산해 보세요."],
      "와카타임": ["assets/image/home_icon/wakatime_icon.svg", "지금까지 한 운동 시간을\n확인해 보세요."],
    };
    return SizedBox(
      height: 240,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: contentsData.length,
        itemBuilder: (context, index) {
          String key = contentsData.keys.elementAt(index);
          return Row(
            children: [
              Container(
                width: 240,
                decoration: BoxDecoration(
                  color: MaeumgagymColor.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        contentsData[key]![0],
                        width: 40,
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PtdTextWidget.titleMedium(
                            key,
                            MaeumgagymColor.black,
                          ),
                          const SizedBox(height: 8),
                          PtdTextWidget.bodyMedium(
                            contentsData[key]![1],
                            MaeumgagymColor.gray600,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: index == contentsData.length - 1 ? 0 : 12),
            ],
          );
        },
      ),
    );
  }
}
