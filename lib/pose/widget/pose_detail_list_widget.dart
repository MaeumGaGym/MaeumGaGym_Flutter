import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../config/maeumgagym_color.dart';
import '../../core/component/text/pretendard/ptd_text_widget.dart';

class PoseDetailListWidget extends StatelessWidget {
  final String title;
  final List<String> listData;

  const PoseDetailListWidget({
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
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: PtdTextWidget.titleMedium(title, MaeumgagymColor.black),
        ),
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
                  SizedBox(
                    width: 52,
                    child: PtdTextWidget.titleMedium(
                      index > 10 ? index.toString() : "0${index + 1}",
                      MaeumgagymColor.gray200,
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 92,
                    child: AutoSizeText(listData[index]),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
