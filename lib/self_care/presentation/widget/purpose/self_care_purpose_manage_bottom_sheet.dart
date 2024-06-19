import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/maeumgagym_toast_message.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/purpose/self_care_purpose_delete_purposes_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/provider/purpose/self_care_purpose_my_purposes_provider.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/purpose/self_care_purpose_edit_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/self_care_default_manage_item_widget.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../provider/purpose/self_care_purpose_calender_provider.dart';

class SelfCarePurposeManageBottomSheet extends ConsumerStatefulWidget {
  final int purposeId;
  final bool inDetail;

  const SelfCarePurposeManageBottomSheet({
    super.key,
    required this.purposeId,
    required this.inDetail,
  });

  @override
  ConsumerState<SelfCarePurposeManageBottomSheet> createState() =>
      _SelfCarePurposeManageBottomSheetState();
}

class _SelfCarePurposeManageBottomSheetState
    extends ConsumerState<SelfCarePurposeManageBottomSheet> {
  void _showToast({required String message}) {
    showTopSnackBar(
      Overlay.of(context),
      MaeumGaGymToastMessage(title: message),
    );
  }

  @override
  Widget build(BuildContext context) {
    final myPurposeNotifier =
    ref.read(selfCarePurposeMyPurposesProvider.notifier);
    final deletePurposesNotifier =
    ref.read(selfCarePurposeDeletePurposesProvider.notifier);
    final purposeStartCalenderNotifier =
    ref.read(selfCarePurposeStartCalenderProvider.notifier);
    final purposeEndCalenderNotifier =
    ref.read(selfCarePurposeEndCalenderProvider.notifier);

    ref.listen(selfCarePurposeDeletePurposesProvider.select((value) => value),
            (previous, next) {
          if (next == const AsyncData<int?>(204)) {
            myPurposeNotifier.getMyPurposeInit();
            if (widget.inDetail) {
              Navigator.of(context).pop();
            }
            Navigator.of(context).pop();
            _showToast(message: "목표를 삭제했어요.");
          }
        });
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        color: MaeumgagymColor.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),

          /// 맨 위 회색 바
          Container(
            width: 64,
            height: 5,
            decoration: BoxDecoration(
              color: MaeumgagymColor.gray300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  Navigator.of(context).pop();
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SelfCarePurposeEditScreen(),
                    ),
                  );

                  purposeStartCalenderNotifier.calenderDateReset();
                  purposeEndCalenderNotifier.calenderDateReset();

                  if (ref
                      .read(selfCarePurposeStartCalenderProvider)
                      .isActive) {
                    purposeStartCalenderNotifier.overlayRemove();
                  }

                  if (ref
                      .read(selfCarePurposeEndCalenderProvider)
                      .isActive) {
                    purposeEndCalenderNotifier.overlayRemove();
                  }
                },
                child: const SelfCareDefaultManageItemWidget(
                  title: "수정",
                  iconPath: "assets/image/self_care_icon/edit_pencil_icon.svg",
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  deletePurposesNotifier.deletePurpose(
                      purposeId: widget.purposeId);
                },
                child: const SelfCareDefaultManageItemWidget(
                  title: "삭제",
                  iconPath: "assets/image/self_care_icon/edit_trash_icon.svg",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
