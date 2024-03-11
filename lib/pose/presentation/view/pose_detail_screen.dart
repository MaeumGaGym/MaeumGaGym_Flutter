import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/pose/presentation/widget/detail/pose_detail_app_bar.dart';
import '../../../core/component/text/pretendard/ptd_text_widget.dart';
import '../widget/detail/pose_detail_body_list_widget.dart';
import '../widget/detail/pose_detail_body_pickle_list_widget.dart';
import '../widget/detail/pose_detail_body_tag.dart';

class PoseDetailScreen extends StatefulWidget {
  final List<String> poseImages, exerciseWay, caution;
  final String simpleName, exactName, simplePart, exactPart, breatheWay;

  const PoseDetailScreen({
    required this.poseImages,
    required this.simpleName,
    required this.exactName,
    required this.simplePart,
    required this.exactPart,
    required this.exerciseWay,
    required this.caution,
    required this.breatheWay,
    super.key,
  });

  @override
  State<PoseDetailScreen> createState() => _PoseDetailScreenState();
}

class _PoseDetailScreenState extends State<PoseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> image = widget.poseImages;
    final String simpleName = widget.simpleName;
    final String exactName = widget.exactName;
    final String simplePart = widget.simplePart;
    final String exactPart = widget.exactPart;
    final String breatheWay = widget.breatheWay;
    final List<String> exerciseWay = widget.exerciseWay;
    final List<String> caution = widget.caution;

    final List<String> pikleList = [
      'assets/image/pose_icon/pickle1.png',
      'assets/image/pose_icon/pickle2.png',
      'assets/image/pose_icon/pickle3.png',
      'assets/image/pose_icon/pickle4.png',
    ];

    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const PoseDetailAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 사진
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: MaeumgagymColor.gray25,
                child: SizedBox(
                  height: 214,
                  child: PageView.builder(
                    itemCount: image.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        image[index],
                        width: MediaQuery.of(context).size.width,
                        height: 214,
                      );
                    },
                  ),
                ),
              ),

              /// 기타 정보들
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// simpleName, exactName
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: SizedBox(
                        height: 88,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Simple Name
                            PtdTextWidget.titleMedium(
                                simpleName, MaeumgagymColor.gray600),

                            /// Exact Name
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: PtdTextWidget.titleLarge(
                                  exactName, MaeumgagymColor.black),
                            )
                          ],
                        ),
                      ),
                    ),

                    /// Tag
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        /// Simple Part
                        PoseDetailBodyTag(tagName: simplePart),

                        const SizedBox(width: 10),

                        /// Exact Part
                        PoseDetailBodyTag(tagName: exactPart)
                      ],
                    ),

                    /// 운동 방법 챕터
                    const SizedBox(height: 36),
                    PoseDetailBodyListWidget(
                      title: '운동 방법',
                      listData: exerciseWay,
                    ),
                    const SizedBox(height: 24),
                    PoseDetailBodyListWidget(title: '주의 사항', listData: caution),
                    const SizedBox(height: 24),
                    PtdTextWidget.titleMedium('호흡법', MaeumgagymColor.black),
                    const SizedBox(height: 12),
                    PtdTextWidget.bodyMedium(
                        breatheWay, MaeumgagymColor.gray800),
                    const SizedBox(height: 24),
                    PtdTextWidget.titleMedium('관련 피클', MaeumgagymColor.black),
                    const SizedBox(height: 24),
                    PoseDetailBodyPickleListWidget(pikleList: pikleList),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
