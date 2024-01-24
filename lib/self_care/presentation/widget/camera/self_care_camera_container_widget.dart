import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';

class SelfCareCameraContainerWidget extends StatelessWidget {
  final String iconPath;

  const SelfCareCameraContainerWidget({
    super.key,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: MaeumgagymColor.gray800,
        borderRadius: BorderRadius.circular(34),
      ),
      child: SvgPicture.asset(
        iconPath,
        color: MaeumgagymColor.white,
      ),
    );
  }
}
