import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Core
import 'package:maeum_ga_gym_flutter/core/component/maeumgagym_button.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:maeum_ga_gym_flutter/core/di/login_option_di.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/provider/maeumgagym_login_provider.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/provider/social_login_provider.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/widget/loading_widget.dart';
import '../../../config/maeumgagym_color.dart';

class SignUpSuccessScreen extends ConsumerWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/image/core_icon/logo.png',
                        width: 102,
                        height: 42,
                      ),
                    ),
                    const SizedBox(height: 51),
                    PtdTextWidget.titleLarge('회원가입 완료', MaeumgagymColor.black),
                    const SizedBox(height: 8),
                    PtdTextWidget.labelMedium(
                        '마음가짐의 회원이 되신 것을 축하드려요!', MaeumgagymColor.gray500),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: MaeumgagymButton(
                        onTap: () async {
                          switch (ref.watch(loginOptionController)) {
                            case LoginOption.google:
                              await ref
                                  .read(maeumgagymLoginController.notifier)
                                  .googleLogin(
                                      ref.watch(socialLoginController).token!);
                              break;
                            case LoginOption.kakao:
                              await ref
                                  .read(maeumgagymLoginController.notifier)
                                  .kakaoLogin(
                                      ref.watch(socialLoginController).token!);
                              break;
                          }

                          ref.watch(maeumgagymLoginController).statusCode.when(
                                data: (data) {
                                  context.go('/');
                                },
                                error: (err, _) {
                                  context.go('/onBoarding');
                                },
                                loading: () {},
                              );
                        },
                        text: '확인',
                        fontSize: 20,
                        fontColor: MaeumgagymColor.white,
                        width: 390,
                        height: 58,
                        color: MaeumgagymColor.blue500,
                        isCircular: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          LoadingWidget(
            state: ref.watch(maeumgagymLoginController).statusCode.isLoading,
          ),
        ],
      ),
    );
  }
}
