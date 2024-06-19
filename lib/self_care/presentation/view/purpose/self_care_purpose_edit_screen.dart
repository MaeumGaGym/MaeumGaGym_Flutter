import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/purpose/self_care_purpose_edit_purposes_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/purpose/self_care_purpose_my_purposes_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/self_care_text_field_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/purpose/self_care_purpose_text_field_list_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_animated_button.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_app_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/component/maeumgagym_toast_message.dart';
import '../../provider/purpose/self_care_purpose_calender_provider.dart';

class SelfCarePurposeEditScreen extends ConsumerStatefulWidget {
  final int purposeId;

  const SelfCarePurposeEditScreen({
    super.key,
    required this.purposeId,
  });

  @override
  ConsumerState<SelfCarePurposeEditScreen> createState() =>
      _SelfCarePurposeEditScreenState();
}

class _SelfCarePurposeEditScreenState
    extends ConsumerState<SelfCarePurposeEditScreen> {
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

    ref.listen(selfCarePurposeEditPurposesProvider.select((value) => value),
        (previous, next) {
      if (next == const AsyncData<int?>(200)) {
        ref.read(selfCarePurposeMyPurposesProvider.notifier).getMyPurposeInit();
        Navigator.of(context).pop();
        showTopSnackBar(
          Overlay.of(context),
          const MaeumGaGymToastMessage(title: "목표를 수정했어요."),
        );
      }
    });

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
              onTap: () {
                ref
                    .read(selfCarePurposeEditPurposesProvider.notifier)
                    .editPurpose(
                      purposeId: widget.purposeId,
                      title: titleController.text,
                      content: contentController.text,
                      startDate: purposeStartCalenderNotifier.dateTimeFormat(),
                      endDate: purposeEndCalenderNotifier.dateTimeFormat(),
                    );
              },
              child: SelfCareAnimatedButton(
                buttonTitle: "수정하기",
                buttonAnimatedTitle: "수정하기",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
