import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_text_field_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/purpose/container/self_care_purpose_text_field_container.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_animated_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';

class SelfCarePurposeEditScreen extends ConsumerWidget {
  const SelfCarePurposeEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
        title: "목표 수정",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SelfCarePurposeTextFieldContainer(),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: MaeumgagymColor.white,
        child: Padding(
          padding: EdgeInsets.only(
            bottom:
            ref.watch(selfCareTextFieldProvider.notifier).state ? 0 : 20,

            /// textfield가 활성화 되면 padding 0, 비활성화 상태라면 padding 20
          ),
          child: const SafeArea(
            child: SelfCareAnimatedButton(
              buttonTitle: "수정하기",
              buttonAnimatedTitle: "수정하기",
            ),
          ),
        ),
      ),
    );
  }
}
