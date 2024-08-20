import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purpose_entity.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/view/purpose_detail_screen.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/widget/purpose_manager_bottom_sheet.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purpose_date_format_func.dart';

import '../../../../../../component/image_widget.dart';
import '../../../../../../core/images.dart';
import '../../../../../core/maeum/maeum_navigation.dart';

class PurposeItemWidget extends StatelessWidget {
  final PurposeEntity purposeData;

  const PurposeItemWidget({
    super.key,
    required this.purposeData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MaeumNavigator.push(context, PurposeDetailScreen(purposeId: purposeData.id)),
      child: Container(
        width: 1.sw - 40.w,
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: MaeumColor.blue50,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Purpose Title
                MaeumText.labelLarge(
                  purposeData.title,
                  MaeumColor.black,
                ),

                SizedBox(height: 4.h),

                /// Purpose 날짜
                MaeumText.bodySmall(
                    "${PurposeDateFormatFunc.formatDate(purposeData.startDate)} ~ ${PurposeDateFormatFunc.formatDate(purposeData.endDate)}",
                    MaeumColor.gray400),
              ],
            ),

            /// 점 세개 아이콘 + BottomSheet
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return PurposeManagerBottomSheet(
                      inDetail: false,
                      purposeData: purposeData,
                    );
                  },
                );
              },
              child: ImageWidget(
                width: 24.w,
                height: 24.h,
                image: Images.iconsDotsVertical,
                color: MaeumColor.gray400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
