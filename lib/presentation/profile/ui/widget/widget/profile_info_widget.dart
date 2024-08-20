import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';

import '../../../../../component/image_widget.dart';
import '../../../../../core/images.dart';

class ProfileInfoWidget extends StatelessWidget {
  final int totalWakatime;

  const ProfileInfoWidget({
    super.key,
    required this.totalWakatime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: MaeumColor.gray50,
          width: 2.w,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MaeumColor.gray50,
            MaeumColor.gray50.withOpacity(0),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 25.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.w),
              child: ImageWidget(
                image: Images.iconsNotDesignSysSparklingIcon,
                imageHeight: 80.h,
                imageWidth: 80.w,
              ),
            ),
            SizedBox(height: 12.h),
            MaeumText.titleMedium(
              "마음 뱃지",
              MaeumColor.black,
            ),
            SizedBox(height: 6.h),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: pretendard,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: MaeumColor.gray400,
                ),
                children: [
                  const TextSpan(
                    text: "총 ",
                  ),
                  TextSpan(
                    style: TextStyle(
                      fontFamily: pretendard,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: MaeumColor.blue500,
                    ),
                    text: totalWakatime.toString(),
                  ),
                  const TextSpan(
                    text: "시간 운동하셨어요!",
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.h),
          ],
        ),
      ),
    );
  }
}
