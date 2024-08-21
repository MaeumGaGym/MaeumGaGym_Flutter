import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/presentation/on_boarding/ui/view/on_boarding_screen.dart';
import 'package:maeumgagym_flutter/presentation/profile/view_model/profile_bloc.dart';
import 'package:maeumgagym_flutter/presentation/profile/view_model/profile_event.dart';

import '../../../../../core/maeum/maeum_color.dart';
import '../../../../../core/maeum/maeum_navigation.dart';
import '../../../../../core/maeum/maeum_text.dart';

class ProfileLogOutDialog extends StatelessWidget {
  const ProfileLogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      /// AlertDialog 보다 크기 조절이 좋음
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
          color: MaeumColor.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,

            /// Widget 아이템 길이만큼 Column 사이즈 지정
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MaeumText.titleMedium(
                "로그아웃",
                MaeumColor.black,
              ),
              SizedBox(height: 8.h),
              MaeumText.labelMedium(
                "로그아웃 하실건가요?",
                MaeumColor.gray700,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => MaeumNavigator.pop(context),
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: MaeumColor.red50,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: MaeumText.labelLarge(
                            "취소",
                            MaeumColor.red500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    /// 구분선을 제외한 Row 사이즈의 반 만큼
                    child: GestureDetector(
                      onTap: () {
                        context.read<ProfileBloc>().add(LogoutEvent());
                        MaeumNavigator.go(context, const OnBoardingScreen());
                      },
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: MaeumColor.red500,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: MaeumText.labelLarge(
                            "탈퇴",
                            MaeumColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
