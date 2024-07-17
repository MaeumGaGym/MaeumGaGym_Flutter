import 'package:flutter/material.dart';

import '../../../config/maeumgagym_color.dart';
import '../../../core/component/image/image_widget.dart';

class RoutineStartMainBottomSheetButton extends StatelessWidget {
  final String icon;
  const RoutineStartMainBottomSheetButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: MaeumgagymColor.blue500,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: ImageWidget(
          width: 20,
          color: MaeumgagymColor.white,
          image: icon,
        ),
      ),
    );
  }
}
