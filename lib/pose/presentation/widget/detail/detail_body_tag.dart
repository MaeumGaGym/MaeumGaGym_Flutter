/// Package
import 'package:flutter/material.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class DetailBodyTag extends StatelessWidget {
  final String tagName;

  const DetailBodyTag({super.key, required this.tagName});

  @override
  Widget build(BuildContext context) {
    /// Tag 배경
    return Container(
      decoration: BoxDecoration(
        color: MaeumgagymColor.blue50,
        borderRadius: BorderRadius.circular(100),
      ),

      /// Tag 글씨
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: PtdTextWidget.labelMedium(tagName, MaeumgagymColor.blue500),
      ),
    );
  }
}
