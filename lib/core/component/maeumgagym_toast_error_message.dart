import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class MaeumGaGymToastErrorMessage extends StatelessWidget {
  final String title;

  const MaeumGaGymToastErrorMessage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MaeumgagymColor.red50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: PtdTextWidget.labelMedium(title, MaeumgagymColor.red500),
    );
  }
}
