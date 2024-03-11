import 'package:flutter/material.dart';

import '../../../../../../config/maeumgagym_color.dart';
import '../../../../../../pose/presentation/view/pose_detail_screen.dart';
import '../../../../text/pretendard/ptd_text_widget.dart';

class PoseRecommendWidgetBottom extends StatelessWidget {
  final String keyData;
  final List<Map<String, dynamic>> data;

  const PoseRecommendWidgetBottom({
    super.key,
    required this.keyData,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var listCount = 0;

    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          if (!(keyData == data[index]['exactPart'])) {
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
                        breatheWay: data[index]['breatheWay'],
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
    );
  }
}
