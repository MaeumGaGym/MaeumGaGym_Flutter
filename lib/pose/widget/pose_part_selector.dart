import 'package:flutter/material.dart';

import '../../config/maeumgagym_color.dart';
import '../../core/component/text/pretendard/ptd_text_widget.dart';

class PosePartSelector extends StatelessWidget {
  final bool state;

  final String title;

  const PosePartSelector({required this.state, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: state ? MaeumgagymColor.blue500 : MaeumgagymColor.gray50,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: PtdTextWidget.labelMedium(
          title,
          state ? MaeumgagymColor.white : MaeumgagymColor.gray600,
        ),
      ),
    );
  }
}
