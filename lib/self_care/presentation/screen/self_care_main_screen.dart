import 'package:flutter/material.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/main/widget/dividing_line_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/main/container/self_care_main_profile_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/main/container/self_care_main_title_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/main/container/self_care_main_widget_list_container.dart';

class SelfCareMainScreen extends StatefulWidget {
  const SelfCareMainScreen({Key? key}) : super(key: key);

  @override
  State<SelfCareMainScreen> createState() => _SelfCareMainScreenState();
}

class _SelfCareMainScreenState extends State<SelfCareMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelfCareMainTitleContainer(),
              DividingLineWidget(),
              SelfCareMainProfileContainer(),
              DividingLineWidget(),
              SelfCareMainWidgetListContainer(),
              DividingLineWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
