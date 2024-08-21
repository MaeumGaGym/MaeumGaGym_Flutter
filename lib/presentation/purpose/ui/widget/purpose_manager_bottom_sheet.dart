import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purpose_entity.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/view/purpose_add_edit_screen.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose_manager_item_widget.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purposes/purposes_event.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../component/maeum_toast_message.dart';
import '../../../../core/images.dart';
import '../../../../core/maeum/maeum_color.dart';
import '../../view_model/purposes/purposes_bloc.dart';

class PurposeManagerBottomSheet extends StatelessWidget {
  final bool inDetail;
  final PurposeEntity purposeData;

  const PurposeManagerBottomSheet({
    super.key,
    required this.purposeData,
    required this.inDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: MaeumColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0.r),
          topRight: Radius.circular(10.0.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),

          /// 맨 위 회색 바
          Container(
            width: 64.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: MaeumColor.gray300,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// 수정 버튼
              PurposeManagerItemWidget(
                onTap: () {
                  MaeumNavigator.pop(context);
                  MaeumNavigator.push(context, PurposeAddEditScreen(purposeData: purposeData));
                },
                title: "수정",
                image: Images.editPencil,
              ),

              /// 삭제 버튼
              PurposeManagerItemWidget(
                onTap: () {
                  MaeumNavigator.pop(context);
                  inDetail ? MaeumNavigator.pop(context) : null;

                  showTopSnackBar(Overlay.of(context), const MaeumToastMessage(title: "목표를 삭제했어요.", isError: true),);

                  context.read<PurposesBloc>().add(DelPurposeEvent(purposeId: purposeData.id));
                },
                title: "삭제",
                image: Images.editTrash,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
