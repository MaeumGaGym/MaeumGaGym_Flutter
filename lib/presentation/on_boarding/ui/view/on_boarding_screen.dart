import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/core/enum/social_state_enum.dart';
import 'package:maeumgagym_flutter/presentation/on_boarding/view_model/maeum_auth_model.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/ui/view/sign_up_agree_screen.dart';
import 'package:maeumgagym_flutter/presentation/splash/ui/view/splash_screen.dart';

import '../../../../component/image_widget.dart';
import '../../../../core/images.dart';
import '../../../../core/maeum/maeum_text.dart';
import '../../../../core/maeum/maeum_color.dart';
import '../../view_model/maeum_auth_bloc.dart';
import '../../view_model/maeum_auth_event.dart';
import '../../view_model/maeum_auth_state.dart';
import '../widget/on_boarding/loading_widget.dart';
import '../widget/on_boarding/on_boarding_contents_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void dialog({required String contents}) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(contents),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("확인"),
              )
            ],
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<MaeumAuthBloc, MaeumAuthState<MaeumAuthModel>>(
              listenWhen: (previous, current) => current.maeumAuthLoginState == BlocStateEnum.error,
              listener: (_, state)  async {
                if(state.error.toString().contains("User Not Found")){
                  await MaeumNavigator.asyncPush(context, SignUpAgreeScreen(
                    oAuthToken: state.value.oAuthToken,
                    socialEnum: state.value.socialEnum,
                  ));

                  if (context.mounted) context.read<MaeumAuthBloc>().add(MaeumSocialLogoutEvent(socialRequest: state.value.socialEnum));
                } else {
                  dialog(contents: state.error.toString());
                }
              },
            ),

            BlocListener<MaeumAuthBloc, MaeumAuthState>(
              listenWhen: (previous, current) => current.maeumAuthLoginState == BlocStateEnum.loaded,
              listener: (_, state) => MaeumNavigator.go(context, const SplashScreen()),
            ),
          ],
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 1.sw - 150.w,
                      height: 1.sw - 150.h,
                      decoration: BoxDecoration(
                        color: MaeumColor.gray50,
                        shape: BoxShape.circle,
                      ),
                      child: ImageWidget(
                        image: Images.iconsNotDesignSysRoutineIcon,
                        imageWidth: 1.sw - 307.w,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  MaeumText.titleMedium('이제 운동을 시작해 보세요!', MaeumColor.black),
                  SizedBox(height: 10.h),
                  MaeumText.onBoardingSubTitle(
                    "마음가짐 서비스를 통해 규칙적인 생활을\n실천해 보세요!",
                    MaeumColor.gray600,
                  ),
                  SizedBox(height: 68.h),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => context.read<MaeumAuthBloc>().add(MaeumLoginEvent(socialRequest: SocialStateEnum.google)),
                      child: const OnBoardingContentsWidget(
                        image: Images.logosGoogleLogoIcon,
                        title: '구글로 로그인',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => context.read<MaeumAuthBloc>().add(MaeumLoginEvent(socialRequest: SocialStateEnum.kakao)),
                      child: const OnBoardingContentsWidget(
                        image: Images.logosKakaoTalkLogoIcon,
                        title: '카카오로 로그인',
                      ),
                    ),
                  ),
                ],
              ),
              LoadingWidget(
                state: context.watch<MaeumAuthBloc>().state.maeumAuthLoginState ==
                        BlocStateEnum.loading,
              )
            ],
          ),
        ),
      ),
    );
  }
}
