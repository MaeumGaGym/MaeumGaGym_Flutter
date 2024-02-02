import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';

import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/main/widget/dividing_line_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/main/container/self_care_main_profile_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/main/container/self_care_main_widget_list_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/calendar/container/self_care_timeline_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_title_container.dart';

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: MaeumgagymColor.blue50,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: SvgPicture.asset("assets/image/self_care_icon/dumbel_icon.svg"),
                    ),
                    const SizedBox(height: 12),
                    const SelfCareDefaultTitleContainer(
                      title: "자기관리",
                      subTitle: "나만의 루틴과 목표를 설정하여\n자기관리에 도전해보세요.",
                    ),
                  ],
                ),
              ),
              const DividingLineWidget(), // 구분선
              const SelfCareMainProfileContainer(),
              const DividingLineWidget(),
              const SelfCareMainWidgetListContainer(),
              const DividingLineWidget(),
              const SelfCareTimelineContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
