import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';

class SelfCareProfileMainSettingContainer extends StatelessWidget {
  const SelfCareProfileMainSettingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 216,
        width: 390,
        decoration: BoxDecoration(
          color: MaeumgagymColor.gray50,
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
