/// Package
import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/pose/domain/model/pose_tag_list_model.dart';

import '../../../../../../../config/maeumgagym_color.dart';
import '../../../../../text/pretendard/ptd_text_widget.dart';

class PosePartWidget extends StatelessWidget {
  final Responses data;
  final bool useNavigator;

  const PosePartWidget({
    required this.data,
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
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => PoseDetailScreen(
          //       poseImages: data[index]['poseImages'],
          //       simpleName: data[index]['simpleName'],
          //       exactName: data[index]['exactName'],
          //       simplePart: data[index]['simplePart'],
          //       exactPart: data[index]['exactPart'],
          //       exerciseWay: data[index]['exerciseWay'],
          //       caution: data[index]['caution'],
          //       breatheWay: data[index]['breatheWay'],
          //     ),
          //   ),
          // );
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
              ImageWidget(
                image: data.thumbnail!,
                imageType: ImageType.pngNetwork,
                width: 64,
                height: 64,
                radiusCircular: 8,
                backgroundColor: MaeumgagymColor.gray25,
              ),
              const SizedBox(width: 18),

              /// 운동 이름
              SizedBox(
                width: MediaQuery.of(context).size.width - 122,
                child:
                    PtdTextWidget.bodyMedium(data.name!, MaeumgagymColor.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
