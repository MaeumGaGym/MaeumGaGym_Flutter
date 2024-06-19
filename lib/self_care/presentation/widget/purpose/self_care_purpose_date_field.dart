import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

import '../../provider/purpose/self_care_purpose_calender_provider.dart';

class SelfCarePurposeDateField extends ConsumerStatefulWidget {
  final String title;
  final CalenderModel calenderState;

  const SelfCarePurposeDateField({
    super.key,
    required this.title,
    required this.calenderState,
  });

  @override
  ConsumerState<SelfCarePurposeDateField> createState() =>
      _SelfCarePurposeDateFieldState();
}

class _SelfCarePurposeDateFieldState
    extends ConsumerState<SelfCarePurposeDateField> {
  @override
  Widget build(BuildContext context) {
    final calenderState = widget.calenderState;

    return CompositedTransformTarget(
      link: calenderState.calenderLayerLink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PtdTextWidget.bodyMedium(
            widget.title,
            calenderState.isActive
                ? MaeumgagymColor.blue500
                : MaeumgagymColor.black,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: calenderState.isActive
                  ? MaeumgagymColor.blue50
                  : MaeumgagymColor.gray25,
              border: Border.all(
                  color: calenderState.isActive
                      ? MaeumgagymColor.blue100
                      : MaeumgagymColor.gray50),
              borderRadius: BorderRadius.circular(8),
            ),
            child: PtdTextWidget.bodyLarge(
              "${calenderState.date.year}년 ${calenderState.date.month}월 ${calenderState.date.day}일",
              MaeumgagymColor.black,
            ),
          ),
        ],
      ),
    );
  }
}
