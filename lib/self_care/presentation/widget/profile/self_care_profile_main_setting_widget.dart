import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image/images.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/view/profile/self_care_profile_edit_screen.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/dialog/self_care_profile_logout_dialog.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/dialog/self_care_profile_quit_dialog.dart';

class SelfCareProfileMainSettingWidget extends StatelessWidget {
  const SelfCareProfileMainSettingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: MaeumgagymColor.gray25,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelfCareProfileEditScreen(),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PtdTextWidget.labelLarge(
                        "내 정보 변경",
                        MaeumgagymColor.black,
                      ),
                      ImageWidget(
                        image: Images.chevronRight,
                        color: MaeumgagymColor.gray200,
                        imageHeight: 24,
                        imageWidth: 24,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return const SelfCareProfileLogoutDialog();
                    },
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PtdTextWidget.bodyLarge(
                        "로그아웃",
                        MaeumgagymColor.black,
                      ),
                      ImageWidget(
                        image: Images.chevronRight,
                        color: MaeumgagymColor.gray200,
                        imageHeight: 24,
                        imageWidth: 24,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,

                    /// dialog가 열렸을 때 빈 화면을 클릭해도 dialog가 꺼지도록 설정
                    builder: (context) {
                      return const SelfCareProfileQuitDialog();
                    },
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PtdTextWidget.bodyLarge(
                        "회원탈퇴",
                        MaeumgagymColor.black,
                      ),
                      ImageWidget(
                        image: Images.chevronRight,
                        color: MaeumgagymColor.gray200,
                        imageHeight: 24,
                        imageWidth: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
