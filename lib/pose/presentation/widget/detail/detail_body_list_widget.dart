/// Package
import 'package:flutter/material.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class DetailBodyListWidget extends StatelessWidget {
  final String title;
  final List<String> listData;

  const DetailBodyListWidget({
    required this.title,
    required this.listData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: PtdTextWidget.titleMedium(title, MaeumgagymColor.black),
        ),

        /// listData로 온 데이터를 ListView.builder로 만들어서 뿌려줌
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 번호
                  SizedBox(
                    width: 52,
                    child: PtdTextWidget.titleMedium(
                      (index + 1).toString().padLeft(2, '0'),
                      MaeumgagymColor.gray200,
                    ),
                  ),

                  /// 콘텐츠
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 7),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 92,
                        child: PtdTextWidget.bodyMedium(
                          listData[index],
                          MaeumgagymColor.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
