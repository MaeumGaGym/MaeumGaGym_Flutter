import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/pose/widget/pose_data.dart';

import '../../config/maeumgagym_color.dart';
import '../../core/component/text/pretendard/ptd_text_widget.dart';
import '../presentation/pose_detail_screen.dart';

class PosePartWidget extends StatelessWidget {
  final int index;

  const PosePartWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          )),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          // height: 88,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(data[index]['poseImages'][0]),
                  ),
                  color: MaeumgagymColor.gray25,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 18),
              SizedBox(
                width: MediaQuery.of(context).size.width - 122,
                child: PtdTextWidget.bodyMedium(
                    data[index]['simpleName']!, MaeumgagymColor.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
