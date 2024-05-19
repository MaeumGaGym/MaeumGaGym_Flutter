import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeungagym_text_style.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/user/self_care_user_get_profile_provider.dart';

class SelfCareProfileMainInfoWidgetContainer extends ConsumerWidget {
  const SelfCareProfileMainInfoWidgetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(selfCareUserGetProfileProvider);
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: MaeumgagymColor.gray50,
            width: 2,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MaeumgagymColor.gray50,
              MaeumgagymColor.gray50.withOpacity(0),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  "assets/image/self_care_icon/sparkling_icon.png",
                  width: 80,
                  height: 80,
                ),
              ),
              const SizedBox(height: 12),
              PtdTextWidget.titleMedium(
                "마음 뱃지",
                MaeumgagymColor.black,
              ),
              const SizedBox(height: 6),
              RichText(
                text: TextSpan(
                  style: MaeumGaGymTextStyle.bodyMedium(MaeumgagymColor.gray600),
                  children: [
                    const TextSpan(
                      text: "총 ",
                    ),
                    TextSpan(
                      style: MaeumGaGymTextStyle.bodyMedium(MaeumgagymColor.blue500),
                      text: profileState.totalWakatime.toString(),
                    ),
                    const TextSpan(
                      text: "시간 운동하셨어요!",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),
            ],
          ),
        ),
      ),
    );
  }
}
