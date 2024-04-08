/// Package
import 'package:flutter/material.dart';

/// Core
import '../../../../text/pretendard/ptd_text_widget.dart';

class PoseTabTextWidget extends StatelessWidget {
  final String text;
  final Color color;

  const PoseTabTextWidget({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 15),
      child: PtdTextWidget.labelLarge(text, color),
    );
  }
}
