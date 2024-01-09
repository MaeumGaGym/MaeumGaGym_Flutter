import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/profile/widget/dialog/self_care_profile_quit_dialog.dart';

class SelfCareProfileMainSettingContainer extends StatelessWidget {
  const SelfCareProfileMainSettingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 216,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: MaeumgagymColor.gray50,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PtdTextWidget.labelLarge(
                      "내 정보 변경",
                      MaeumgagymColor.black,
                    ),
                    SvgPicture.asset(
                        "assets/image/core_icon/right_arrow_icon.svg"),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PtdTextWidget.labelLarge(
                      "로그아웃",
                      MaeumgagymColor.black,
                    ),
                    SvgPicture.asset(
                        "assets/image/core_icon/right_arrow_icon.svg"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
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
                      PtdTextWidget.labelLarge(
                        "회원탈퇴",
                        MaeumgagymColor.black,
                      ),
                      SvgPicture.asset(
                          "assets/image/core_icon/right_arrow_icon.svg"),
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
