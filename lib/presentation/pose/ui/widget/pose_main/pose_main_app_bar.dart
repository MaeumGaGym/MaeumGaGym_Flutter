import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/presentation/pose/ui/view/pose_search_screen.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';

class PoseMainAppBar extends StatelessWidget {
  final bool innerBoxIsScrolled;

  const PoseMainAppBar({
    super.key,
    required this.innerBoxIsScrolled,
  });

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        backgroundColor: MaeumColor.white,
        surfaceTintColor: MaeumColor.white,

        /// Search_Icon
        title: Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  MaeumNavigator.push(context, const PoseSearchScreen());
                  // await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const PoseSearchScreen(),
                  //   ),
                  // );
                  // ref.read(poseSearchController.notifier).state = '';
                },
                child: ImageWidget(
                  image: Images.iconsSearch,
                  width: 28.w,
                  height: 28.h,
                ),
              ),
            ],
          ),
        ),

        /// 자세 글씨
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MaeumText.titleLarge('자세', MaeumColor.black),
              ],
            ),
          ),
        ),

        /// 화면 내릴때 고정이 되지 않음
        pinned: false,
        expandedHeight: 100.h,
        forceElevated: innerBoxIsScrolled,
      ),
    );
  }
}