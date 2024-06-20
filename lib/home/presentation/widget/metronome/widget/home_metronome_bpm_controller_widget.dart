import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';

class HomeMetronomeBpmControllerWidget extends StatelessWidget {
  final String iconPath;

  const HomeMetronomeBpmControllerWidget({
    super.key,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MaeumgagymColor.gray50,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ImageWidget(
          image: iconPath,
          width: 24,
          height: 24,
          color: MaeumgagymColor.gray300,
        ),
      ),
    );
  }
}
