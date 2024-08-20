import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_color.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_text.dart';
import 'package:maeumgagym_flutter/presentation/profile/ui/widget/widget/profile_quit_confirm_dialog.dart';

class ProfileQuitDialog extends StatelessWidget {
  const ProfileQuitDialog({super.key});

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
                "회원탈퇴",
                MaeumColor.black,
              ),
              SizedBox(height: 8.h),
              MaeumText.labelMedium(
                "정말 탈퇴하실건가요?\n30일 뒤에 활동이 모두 삭제돼요.",
                MaeumColor.gray700,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
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
                        MaeumNavigator.pop(context);

                        showDialog(
                          context: context,
                          barrierDismissible: true,

                          /// dialog가 열렸을 때 빈 화면을 클릭해도 dialog가 꺼지도록 설정
                          builder: (context) {
                            return const ProfileQuitConfirmDialog();
                          },
                        );
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
