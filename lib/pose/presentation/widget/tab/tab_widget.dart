/// Package
import 'package:flutter/material.dart';

/// Core
import '../../../../config/maeumgagym_color.dart';
import '../../../../core/component/text/pretendard/ptd_text_widget.dart';

class TabWidget extends StatelessWidget {
  final String text;

  const TabWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 15),
        child: PtdTextWidget.labelLarge(text, MaeumgagymColor.black),
      ),
    );
  }
}
