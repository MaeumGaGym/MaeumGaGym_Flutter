import 'package:flutter/material.dart';

import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/container/self_care_profile_main_info_widget_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/container/self_care_profile_main_setting_container.dart';

import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_title_container.dart';

class SelfCareProfileMainScreen extends StatelessWidget {
  const SelfCareProfileMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
      ),
      body: SafeArea(
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: MaeumgagymColor.gray100, shape: BoxShape.circle),
                  ),
                  const SizedBox(height: 16),
                  PtdTextWidget.titleMedium(
                    "조현석",
                    MaeumgagymColor.black,
                  ),
                  const SizedBox(height: 32),
                  const SelfCareProfileMainInfoWidgetContainer(),
                  const SizedBox(height: 32),
                  const SelfCareProfileMainSettingContainer(),
                  const SizedBox(height: 31),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
