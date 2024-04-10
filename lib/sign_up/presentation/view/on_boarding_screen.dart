/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Core
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/component/image_widget.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/provider/maeumgagym_login_provider.dart';
import 'package:maeum_ga_gym_flutter/core/re_issue/presentation/maeumgagym_re_issue_provider.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/provider/maeumgagym_recovery_provider.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/provider/social_login_provider.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/widget/loading_widget.dart';
import '../../../core/component/text/pretendard/ptd_text_widget.dart';
import '../../../core/di/login_option_di.dart';

/// Widget
import 'package:maeum_ga_gym_flutter/sign_up/presentation/widget/on_boarding_contents_widget.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final socialLoginNotifier = ref.read(socialLoginController.notifier);
    ref.read(maeumgagymReIssueController.notifier);
    final maeumgagymLoginNotifier =
        ref.read(maeumgagymLoginController.notifier);

    AlertDialog dialog(String title, String contents) {
      return AlertDialog(
        title: Text(title),
        content: Text(contents),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("확인"),
          )
        ],
      );
    }

    Future<void> whenMaeumgagymLoginIs404(
        LoginOption loginOption, String oauthToken) async {
      await ref
          .read(maeumgagymRecoveryController.notifier)
          .switchRecovery(loginOption, oauthToken);

      ref.watch(maeumgagymRecoveryController).when(
            data: (data) async {
              if (data == 404) {
                await context.push('/signUpAgree');
                await socialLoginNotifier.logout();
              } else {
                context.go('/home');
              }
            },
            error: (err, _) {
              showDialog(
                context: context,
                builder: (context) {
                  return dialog(
                    "Maeumgagym Recovery Error",
                    err.toString(),
                  );
                },
              );
            },
            loading: () {},
          );
    }

    Future<void> whenSuccessSocialLogin(LoginOption loginOption) async {
      switch (loginOption) {
        case LoginOption.google:
          await maeumgagymLoginNotifier.googleLogin(
            ref.watch(socialLoginController).token!,
          );
          break;

        case LoginOption.kakao:
          await maeumgagymLoginNotifier.kakaoLogin(
            ref.watch(socialLoginController).token!,
          );
          break;
        case LoginOption.all:
          break;
      }

      ref.watch(maeumgagymLoginController).statusCode.when(
            data: (data) async {
              if (data == 404) {
                whenMaeumgagymLoginIs404(
                  loginOption,
                  ref.watch(socialLoginController).token!,
                );
              } else {
                context.go('/home');
              }
            },
            error: (err, _) {
              showDialog(
                context: context,
                builder: (context) {
                  return dialog(
                    "Maeumgagym Login Error",
                    err.toString(),
                  );
                },
              );
              ref.watch(maeumgagymLoginController).statusCode =
                  const AsyncData(500);
            },
            loading: () {},
          );
    }

    Future<void> clickLoginButton(LoginOption loginOption) async {
      ref.read(loginOptionController.notifier).state = loginOption;

      /// Login Option 설정
      await socialLoginNotifier.setLoginOption(loginOption);

      /// socialLogin 시도
      try {
        await socialLoginNotifier.login(loginOption);
        debugPrint(ref.watch(socialLoginController).token);
      } catch (err) {
        // debugPrint("소셜 로그인 실패! : ${err.toString()}");
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) {
              return dialog(
                "Social Login Failed",
                err.toString(),
              );
            },
          );
        }
      }

      /// socialLogin이 되었다면
      ref.read(socialLoginController).stateus.when(
            data: (data) => whenSuccessSocialLogin(loginOption),
            error: (err, __) {
              showDialog(
                context: context,
                builder: (context) {
                  return dialog(
                    "Social Login Failed",
                    err.toString(),
                  );
                },
              );
            },
            loading: () {},
          );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 150,
                    height: MediaQuery.of(context).size.width - 150,
                    decoration: BoxDecoration(
                      color: MaeumgagymColor.gray50,
                      shape: BoxShape.circle,
                    ),
                    child: const ImageWidget(
                      imageType: ImageType.svg,
                      image:
                          'assets/image/on_boarding_icon/on_boarding_circle_image.svg',
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                PtdTextWidget.titleMedium(
                    '이제 운동을 시작해 보세요!', MaeumgagymColor.black),
                const SizedBox(height: 10),
                PtdTextWidget.onBoardingSubTitle(
                  '저희의 좋은 서비스를 통해 즐거운 헬창 생활을\n즐겨보세요!',
                  MaeumgagymColor.gray600,
                ),
                const SizedBox(height: 68),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: GestureDetector(
                    onTap: () async {
                      clickLoginButton(LoginOption.google);
                    },
                    child: const OnBoardingContentsWidget(
                      image: 'assets/image/on_boarding_icon/google_logo.svg',
                      title: '구글로 로그인',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: GestureDetector(
                    onTap: () async {
                      clickLoginButton(LoginOption.kakao);
                    },
                    child: const OnBoardingContentsWidget(
                      image:
                          'assets/image/on_boarding_icon/kakao_talk_logo.svg',
                      title: '카카오로 로그인',
                    ),
                  ),
                ),
              ],
            ),
            LoadingWidget(
              state: ref.watch(maeumgagymRecoveryController).hasValue &&
                  ref.watch(maeumgagymLoginController).statusCode.hasValue &&
                  ref.watch(socialLoginController).stateus.hasValue,
            )
          ],
        ),
      ),
    );
  }
}
