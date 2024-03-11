import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/providers/metronome_state_provider.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/home_setting_app_bar.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/widget/metronome/widget/home_metronome_setting_item_widget.dart';

class HomeMetronomeSettingScreen extends ConsumerWidget {
  const HomeMetronomeSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metronomeState = ref.watch(metronomeController);
    final metronomeNotifier = ref.read(metronomeController.notifier);
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const HomeSettingAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeMetronomeSettingItemWidget(
                title: "메트로놈 모드",
                value: "작은 원",
              ),
              const SizedBox(height: 10),
              const HomeMetronomeSettingItemWidget(
                title: "비트 사운드",
                value: "사인",
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PtdTextWidget.metronomeSettingTitle(
                      "백그라운드",
                      MaeumgagymColor.black,
                    ),
                    CupertinoSwitch(
                      thumbColor: MaeumgagymColor.white,
                      activeColor: MaeumgagymColor.blue400,
                      trackColor: MaeumgagymColor.gray100,
                      value: metronomeState.onBackGround,
                      onChanged: (value) {
                        metronomeNotifier.changeBackGround();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
