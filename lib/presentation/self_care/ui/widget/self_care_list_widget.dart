import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/presentation/empty_view/view/empty_view_screen.dart';
import 'package:maeumgagym_flutter/presentation/purpose/ui/view/purpose_screen.dart';
import 'package:maeumgagym_flutter/presentation/routine/ui/view/routine_screen.dart';
import 'package:maeumgagym_flutter/presentation/self_care/ui/widget/self_care_item_widget.dart';

import '../../../../core/images.dart';

class SelfCareListWidget extends StatelessWidget {
  const SelfCareListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: MaeumText.titleMedium(
              "자기관리",
              MaeumColor.black,
            ),
          ),
          SizedBox(height: 12.h),
          SelfCareItemWidget(
            width: 25.w,
            height: 28.h,
            imagePath: Images.iconsNotDesignSysRoutineIcon,
            title: "내 루틴",
            routePage: const RoutineScreen(),
          ),
          SelfCareItemWidget(
            width: 25.w,
            height: 28.h,
            imagePath: Images.iconsNotDesignSysTargetIcon,
            title: "목표",
            routePage: const PurposeScreen(),
          ),
          SelfCareItemWidget(
            width: 25.w,
            height: 28.h,
            imagePath: Images.iconsNotDesignSysDietIcon,
            title: "식단",
            routePage: const EmptyViewScreen(useAppBar: true),
          ),
          SelfCareItemWidget(
            width: 25.w,
            height: 28.h,
            imagePath: Images.iconsNotDesignSysTodayExcersizeCompleteIcon,
            title: "오운완",
            routePage: const EmptyViewScreen(useAppBar: true),
          ),
        ],
      ),
    );
  }
}
