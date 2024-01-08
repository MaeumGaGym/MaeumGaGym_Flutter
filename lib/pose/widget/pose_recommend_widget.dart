/// Package
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/pose_detail_screen.dart';

/// Core
import '../../config/maeumgagym_color.dart';
import '../../core/component/text/pretendard/ptd_text_widget.dart';

class PoseRecommendWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final int index;
  final String keyData, titleImage;

  const PoseRecommendWidget({
    required this.data,
    required this.keyData,
    required this.titleImage,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var listCount = 0;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 340,
      child: Column(
        children: [
          const SizedBox(height: 24),

          /// ~~ 운동 상단
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Image
                  Image.asset(
                    titleImage,
                    width: 40,
                    height: 40,
                  ),

                  /// 맨몸 운동 글씨
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: PtdTextWidget.titleMedium(
                        "$keyData 운동", MaeumgagymColor.black),
                  ),
                ],
              ),
              GestureDetector(
                //onTap: () => tabController.index = index,
                child: Row(
                  children: [
                    PtdTextWidget.bodyMedium('더보기', MaeumgagymColor.gray400),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 6),
                      child: SvgPicture.asset(
                        "assets/image/pose_icon/ios_right_arrow.svg",
                        width: 6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// ~ 운동 하단
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (!(keyData == data[index]['simplePart'])) {
                  return const SizedBox.shrink();
                } else if (listCount >= 3) {
                  return const SizedBox.shrink();
                } else {
                  listCount++;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PoseDetailScreen(
                              poseImages: data[index]['poseImages'],
                              simpleName: data[index]['simpleName'],
                              exactName: data[index]['exactName'],
                              simplePart: data[index]['simplePart'],
                              exactPart: data[index]['exactPart'],
                              exerciseWay: data[index]['exerciseWay'],
                              caution: data[index]['caution'],
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Container(
                            width: 148,
                            height: 148,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: MaeumgagymColor.gray25,
                            ),
                            child: Center(
                              child: Image.asset(data[index]['poseImages'][0]!),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      /// SimpleName
                      SizedBox(
                        width: 148,
                        child: PtdTextWidget.labelMedium(
                          data[index]['simpleName'],
                          MaeumgagymColor.black,
                        ),
                      ),
                      const SizedBox(height: 4),

                      /// ExactPart
                      PtdTextWidget.bodyMedium(
                          data[index]['exactPart']!, MaeumgagymColor.black),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
