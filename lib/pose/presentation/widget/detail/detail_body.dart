/// Package
import 'package:flutter/material.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

/// Widget
import 'detail_body_list_widget.dart';
import 'detail_body_pickle_list_widget.dart';
import 'detail_body_tag.dart';

class DetailBody extends StatelessWidget {
  final List<String> image, exerciseWay, caution, pikleList;
  final String simpleName, exactName, simplePart, exactPart;

  const DetailBody(
      {super.key,
      required this.image,
      required this.exerciseWay,
      required this.caution,
      required this.pikleList,
      required this.simpleName,
      required this.exactPart,
      required this.simplePart,
      required this.exactName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    DetailBodyTag(tagName: simplePart),

                    const SizedBox(width: 10),

                    /// Exact Part
                    DetailBodyTag(tagName: exactPart)
                  ],
                ),

                /// 운동 방법 챕터
                const SizedBox(height: 36),
                DetailBodyListWidget(title: '운동 방법', listData: exerciseWay),
                const SizedBox(height: 24),
                DetailBodyListWidget(title: '주의 사항', listData: caution),
                const SizedBox(height: 24),
                PtdTextWidget.titleMedium('관련 피클', MaeumgagymColor.black),
                const SizedBox(height: 24),
                DetailBodyPickleListWidget(pikleList: pikleList),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
