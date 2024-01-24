import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

class SelfCareMyRoutineToastMessage extends StatelessWidget {
  final String title;
  const SelfCareMyRoutineToastMessage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MaeumgagymColor.gray100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: PtdTextWidget.labelMedium(
        title,
        MaeumgagymColor.black,
      ),
    );
  }
}
