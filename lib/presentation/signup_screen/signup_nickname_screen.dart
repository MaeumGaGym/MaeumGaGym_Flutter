/// Package
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Core
import 'package:wewith_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:wewith_flutter/core/component/check_button.dart';
import 'package:wewith_flutter/core/constant/maeumgagym_color.dart';

/// widget
import 'package:wewith_flutter/presentation/signup_screen/provider/provider/textfield_control_provider.dart';

class SignUpNickNameScreen extends StatelessWidget {
  const SignUpNickNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nicknameController = TextEditingController();
    var textFieldState = Provider.of<TextFieldControlProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 뒤로가기 버튼
            GestureDetector(
              onTap: () {
                context.go('/signupAgree');
              },
              child: SvgPicture.asset(
                'assets/image/left_arrow.svg',
                width: 24.w,
                height: 24.h,
              ),
            ).padding(top: 12.h, left: 20.w, right: 20.w),

            /// 닉네임 글자
            PtdTextWidget.semiBold('닉네임', 36, MaeumGaGymColor.black)
                .padding(top: 32.h, left: 20.w, right: 20.w),

            /// 서비스 이용을 위해 필수 약관동의가 필요해요. 글자
            PtdTextWidget.regular(
                    '자신만의 닉네임을 입력해 주세요', 16, MaeumGaGymColor.gray600)
                .padding(top: 8.h, left: 20.w, right: 20.w),

            /// 닉네임 TextField
            SizedBox(
              height: 66.h,
              child: Center(
                child: TextField(
                  controller: nicknameController,
                  onTap: () {
                    textFieldState.onClick();
                  },
                  onTapOutside: (event) {
                    textFieldState.onClick();
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MaeumGaGymColor.blue500),
                    ),
                    label: PtdTextWidget.regular(
                        '닉네임', 20, MaeumGaGymColor.gray400),
                  ),
                ),
              ),
            ).padding(top: 32.h, left: 20.w, right: 20.w),

            /// 이미 사용중인 닉네임이에요.
            PtdTextWidget.regular('이미 사용중인 닉네임이에요.', 12, MaeumGaGymColor.red500)
                .padding(top: 8.h, left: 20.w),

            /// 공간을 위한
            const Expanded(child: SizedBox()),

            /// 회원가입 버튼
            Center(
              child: textFieldState.textFieldState
                  ? CheckButton(
                      isCircular: false,
                      width: 430,
                      height: 58,
                      color: MaeumGaGymColor.blue500,
                      route: '/',
                      textWidget: PtdTextWidget.medium(
                          '회원가입', 20, MaeumGaGymColor.white),
                      notUseRoute: false,
                    )
                  : CheckButton(
                      isCircular: true,
                      width: 390,
                      height: 58,
                      color: MaeumGaGymColor.blue500,
                      route: '/',
                      textWidget: PtdTextWidget.medium(
                          '회원가입', 20, MaeumGaGymColor.white),
                      notUseRoute: false,
                    ).padding(bottom: 20.h),
            ),
          ],
        ),
      ),
    );
  }
}
