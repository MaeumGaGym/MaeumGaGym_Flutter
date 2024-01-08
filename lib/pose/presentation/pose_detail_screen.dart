/// Package
import 'package:flutter/material.dart';

/// Core
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

/// Widget
import 'package:maeum_ga_gym_flutter/pose/widget/pose_detail_list_widget.dart';

class PoseDetailScreen extends StatefulWidget {
  final List<String> poseImages, exerciseWay, caution;
  final String simpleName, exactName, simplePart, exactPart;

  const PoseDetailScreen({
    required this.poseImages,
    required this.simpleName,
    required this.exactName,
    required this.simplePart,
    required this.exactPart,
    required this.exerciseWay,
    required this.caution,
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
    final List<String> exerciseWay = widget.exerciseWay;
    final List<String> caution = widget.caution;

    final List<String> pikleList = [
      'assets/image/pose_icon/pickle1.png',
      'assets/image/pose_icon/pickle2.png',
      'assets/image/pose_icon/pickle3.png',
      'assets/image/pose_icon/pickle4.png',
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),

        /// AppBar
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// 루틴에 추가
              Container(
                decoration: BoxDecoration(
                    color: MaeumgagymColor.blue50,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Center(
                    child: PtdTextWidget.labelSmall(
                      '루틴에 추가',
                      MaeumgagymColor.blue500,
                      null,
                      null,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
                    /// part, name
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: SizedBox(
                        height: 88,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PtdTextWidget.titleMedium(
                                simpleName, MaeumgagymColor.gray600),
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
                        Container(
                          decoration: BoxDecoration(
                            color: MaeumgagymColor.blue50,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: PtdTextWidget.labelMedium(
                                simplePart, MaeumgagymColor.blue500),
                          ),
                        ),
                        const SizedBox(width: 10),

                        /// Exact Part
                        Container(
                          decoration: BoxDecoration(
                            color: MaeumgagymColor.blue50,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: PtdTextWidget.labelMedium(
                                exactPart, MaeumgagymColor.blue500),
                          ),
                        ),
                      ],
                    ),

                    /// 운동 방법 챕터
                    const SizedBox(height: 36),
                    PoseDetailListWidget(title: '운동 방법', listData: exerciseWay),
                    const SizedBox(height: 24),
                    PoseDetailListWidget(title: '주의 사항', listData: caution),
                    const SizedBox(height: 24),
                    PtdTextWidget.titleMedium('관련 피클', MaeumgagymColor.black),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 224,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: pikleList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Container(
                              width: 126,
                              height: 224,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(pikleList[index]),
                            ),
                          );
                        },
                      ),
                    ),
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
