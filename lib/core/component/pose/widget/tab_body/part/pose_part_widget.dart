/// Package
import 'package:flutter/material.dart';

/// core
import '../../../../../../config/maeumgagym_color.dart';
import '../../../../text/pretendard/ptd_text_widget.dart';

/// Widget
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/pose_data.dart';
import '../../../../../../pose/presentation/view/pose_detail_screen.dart';

class PosePartWidget extends StatelessWidget {
  final int index;
  final bool useNavigator;

  const PosePartWidget({
    required this.index,
    required this.useNavigator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// 눌렀을 때 PoseDetailScreen
    return GestureDetector(
      onTap: () {
        /// useNavigator 가 true 일때
        if (useNavigator) {
          /// PoseDetailScreen 으로 이동
          Navigator.push(
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
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// 운동 사진
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

              /// 운동 이름
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
