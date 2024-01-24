import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

class SelfCareMyRoutinePoseAddScreen extends StatefulWidget {
  const SelfCareMyRoutinePoseAddScreen({super.key});

  @override
  State<SelfCareMyRoutinePoseAddScreen> createState() => _SelfCareMyRoutinePoseAddScreenState();
}

class _SelfCareMyRoutinePoseAddScreenState extends State<SelfCareMyRoutinePoseAddScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/self_care_icon/close_icon.svg",
        title: "루틴 자세 추가",
      ),
    );
  }
}
