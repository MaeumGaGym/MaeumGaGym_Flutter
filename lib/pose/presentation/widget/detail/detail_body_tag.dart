import 'package:flutter/material.dart';

import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class DetailBodyTag extends StatelessWidget {
  final String tagName;

  const DetailBodyTag({super.key, required this.tagName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MaeumgagymColor.blue50,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: PtdTextWidget.labelMedium(tagName, MaeumgagymColor.blue500),
      ),
    );
  }
}
