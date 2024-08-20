import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maeumgagym_flutter/component/image_widget.dart';
import 'package:maeumgagym_flutter/core/images.dart';
import 'package:maeumgagym_flutter/component/maeum_button.dart';
import 'package:maeumgagym_flutter/component/my_scaffold.dart';
import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';
import 'package:maeumgagym_flutter/core/maeum/maeum_navigation.dart';
import 'package:maeumgagym_flutter/data/auth/dto/request/maeum_sign_up_request.dart';
import 'package:maeumgagym_flutter/core/enum/social_state_enum.dart';
import 'package:maeumgagym_flutter/presentation/on_boarding/ui/view/on_boarding_screen.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/success/sign_up_success_bloc.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/success/sign_up_success_event.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/success/sign_up_success_state.dart';
import 'package:maeumgagym_flutter/presentation/splash/ui/view/splash_screen.dart';

import '../../../../core/maeum/maeum_text.dart';
import '../../../../core/maeum/maeum_color.dart';

class SignUpSuccessScreen extends StatelessWidget {
  final SocialStateEnum socialEnum;
  final String oAuthToken, nickName;

  const SignUpSuccessScreen({super.key,
    required this.socialEnum,
    required this.oAuthToken,
    required this.nickName,

  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignUpSuccessBloc, SignUpSuccessState>(
          listenWhen: (previous, current) => current.blocStateEnum == BlocStateEnum.error,
          listener: (context, state) => MaeumNavigator.go(context, const OnBoardingScreen()),
        ),

        BlocListener<SignUpSuccessBloc, SignUpSuccessState>(
          listenWhen: (previous, current) => current.blocStateEnum == BlocStateEnum.loaded,
          listener: (context, state) => MaeumNavigator.go(context, const SplashScreen()),
        ),
      ],
      child: MyScaffold(
        bottomSheet: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: BlocBuilder<SignUpSuccessBloc, SignUpSuccessState>(
            builder: (context, state) {
              if(state.blocStateEnum == BlocStateEnum.loading){
                return Container(
                  width: 1.sw - 40.w,
                  height: 58.h,
                  color: MaeumColor.gray400,
                  child: Center(child: CircularProgressIndicator(color: MaeumColor.blue500,),),
                );
              } else {
                return GestureDetector(
                  onTap: () => context.read<SignUpSuccessBloc>().add(
                        SignUpSuccessEvent(
                          maeumSignUpRequest: MaeumSignUpRequest(
                            socialEnum: socialEnum,
                            oAuthToken: oAuthToken,
                            nickName: nickName,
                          ),
                        ),
                      ),
                  child: MaeumButton(
                    width: 1.sw - 40.w,
                    height: 58.h,
                    text: "확인",
                    borderRadius: 8.r,
                    color: MaeumColor.blue500,
                    fontColor: MaeumColor.white,
                  ),
                );
              }
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(image: Images.logosLogo, width: 120.w),
              SizedBox(height: 51.h),
              MaeumText.titleLarge('회원가입 완료', MaeumColor.black),
              SizedBox(height: 8.h),
              MaeumText.labelMedium('마음가짐의 회원이 되신 것을 축하드려요!', MaeumColor.gray500),
            ],
          ),
        ),
      ),
    );
  }
}