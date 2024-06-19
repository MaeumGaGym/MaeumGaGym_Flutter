import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeumgagym_toast_message.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/purpose/self_care_purpose_calender_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/purpose/self_care_purpose_create_purposes_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_text_field_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/purpose/self_care_purpose_text_field_list_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_animated_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../provider/purpose/self_care_purpose_my_purposes_provider.dart';

class SelfCarePurposeAddScreen extends ConsumerStatefulWidget {
  const SelfCarePurposeAddScreen({super.key});

  @override
  ConsumerState<SelfCarePurposeAddScreen> createState() =>
      _SelfCarePurposeAddScreenState();
}

class _SelfCarePurposeAddScreenState
    extends ConsumerState<SelfCarePurposeAddScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final purposeStartCalenderNotifier =
        ref.read(selfCarePurposeStartCalenderProvider.notifier);
    final purposeEndCalenderNotifier =
        ref.read(selfCarePurposeEndCalenderProvider.notifier);

    ref.listen(selfCarePurposeCreateProvider.select((value) => value),
        (previous, next) {
      if (next == const AsyncData<int?>(201)) {
        ref.read(selfCarePurposeMyPurposesProvider.notifier).getMyPurposeInit();
        Navigator.of(context).pop();
        showTopSnackBar(
          Overlay.of(context),
          const MaeumGaGymToastMessage(title: "목표를 추가했어요."),
        );
      }
    });

    return Scaffold(
      backgroundColor: MaeumgagymColor.white,
      appBar: const SelfCareDefaultAppBar(
        iconPath: "assets/image/core_icon/left_arrow_icon.svg",
        title: "목표 추가",
      ),
      body: GestureDetector(
        onTap: () {
          if (ref.read(selfCarePurposeStartCalenderProvider).isActive) {
            purposeStartCalenderNotifier.overlayRemove();
          }

          if (ref.read(selfCarePurposeEndCalenderProvider).isActive) {
            purposeEndCalenderNotifier.overlayRemove();
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelfCarePurposeTextFieldListWidget(
                    titleController: titleController,
                    contentController: contentController,
                  ),
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                ],
              ),
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
          child: SafeArea(
            child: GestureDetector(
              onTap: () async {
                await ref
                    .read(selfCarePurposeCreateProvider.notifier)
                    .createPurpose(
                      title: titleController.text,
                      content: contentController.text,
                      startDate: purposeStartCalenderNotifier.dateTimeFormat(),
                      endDate: purposeEndCalenderNotifier.dateTimeFormat(),
                    );
              },
              child: const SelfCareAnimatedButton(
                buttonTitle: "확인",
                buttonAnimatedTitle: "확인",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
