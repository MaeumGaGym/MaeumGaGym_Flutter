import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';

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
        child: SvgPicture.asset(
          iconPath,
          color: MaeumgagymColor.gray300,
        ),
      ),
    );
  }
}
