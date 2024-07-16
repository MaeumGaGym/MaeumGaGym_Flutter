import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/self_care_profile_main_info_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/self_care_profile_main_setting_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

import '../../provider/profile/self_care_profile_get_profile_provider.dart';

class SelfCareProfileMainScreen extends ConsumerStatefulWidget {
  const SelfCareProfileMainScreen({super.key});

  @override
  ConsumerState<SelfCareProfileMainScreen> createState() =>
      _SelfCareProfileMainScreenState();
}

class _SelfCareProfileMainScreenState
    extends ConsumerState<SelfCareProfileMainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(selfCareProfileGetProfileProvider.notifier)
          .getUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(selfCareProfileGetProfileProvider);

    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: Images.arrowLeft,
      ),
      body: Builder(builder: (context) {
        if (ref.watch(selfCareProfileGetProfileProvider).statusCode.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: MaeumgagymColor.blue500,
            ),
          );
        } else {
          return SafeArea(
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
                            profileState.profileImage.toString(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      PtdTextWidget.titleMedium(
                        profileState.nickname.toString(),
                        MaeumgagymColor.black,
                      ),
                      const SizedBox(height: 32),
                      SelfCareProfileMainInfoWidget(totalWakaTime: profileState.totalWakatime!),
                      const SizedBox(height: 32),
                      const SelfCareProfileMainSettingWidget(),
                      const SizedBox(height: 31),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
