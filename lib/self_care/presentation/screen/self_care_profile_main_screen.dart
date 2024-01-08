import 'package:flutter/material.dart';

import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/container/self_care_profile_main_info_widget_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/container/self_care_profile_main_setting_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/container/self_care_profile_main_title_container.dart';

import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

class SelfCareProfileMainScreen extends StatelessWidget {
  const SelfCareProfileMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelfCareProfileMainTitleContainer(),
              SizedBox(height: 32),
              SelfCareProfileMainInfoWidgetContainer(),
              SizedBox(height: 32),
              SelfCareProfileMainSettingContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
