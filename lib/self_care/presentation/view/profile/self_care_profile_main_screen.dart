import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/self_care_profile_main_info_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/self_care_profile_main_setting_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

class SelfCareProfileMainScreen extends ConsumerStatefulWidget {
  final String profileImage, nickname;
  final int totalWakaTime;

  const SelfCareProfileMainScreen({
    Key? key,
    required this.profileImage,
    required this.nickname,
    required this.totalWakaTime,
  }) : super(key: key);

  @override
  ConsumerState<SelfCareProfileMainScreen> createState() =>
      _SelfCareProfileMainScreenState();
}

class _SelfCareProfileMainScreenState
    extends ConsumerState<SelfCareProfileMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: Images.arrowLeft,
      ),
      body: SafeArea(
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        widget.profileImage,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  PtdTextWidget.titleMedium(
                    widget.nickname,
                    // profileState.nickname.toString(),

                    /// 그럴일은 없겠지만 만약 진짜 만약 값이 null 이라면 null 그대로 출력하도록 구현
                    MaeumgagymColor.black,
                  ),
                  const SizedBox(height: 32),
                  SelfCareProfileMainInfoWidget(totalWakaTime: widget.totalWakaTime,),
                  const SizedBox(height: 32),
                  const SelfCareProfileMainSettingWidget(),
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
