/// Package
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Core
import 'package:maeum_ga_gym_flutter/config/maeumgagym_color.dart';
import 'package:maeum_ga_gym_flutter/core/di/token_secure_storage_di.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/provider/maeumgagym_login_provider.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/provider/maeumgagym_re_issue_provider.dart';
import 'package:maeum_ga_gym_flutter/sign_up/presentation/provider/social_login_provider.dart';
import '../../../core/component/text/pretendard/ptd_text_widget.dart';

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
    late String? refreshToken;

    final socialLoginNotifier = ref.read(socialLoginController.notifier);
    final maeumgagymLoginNotifier =
        ref.read(maeumgagymLoginController.notifier);

    Future<void> clickLoginButton(LoginOption loginOption) async {
      refreshToken = await TokenSecureStorageDi.readRefreshToken();

      debugPrint("refreshToken : $refreshToken");

      if (refreshToken != null) {
        await ref
            .read(maeumgagymReIssueController.notifier)
            .getReIssue(refreshToken!);

        debugPrint(
            ref.watch(maeumgagymReIssueController).stateusCode.toString());

        if (ref.watch(maeumgagymReIssueController).stateusCode == 200 &&
            context.mounted) {
          context.go('/home');
        }
      }

      /// Login Option을 google로 설정
      await socialLoginNotifier.setLoginOption(loginOption);

      /// socialLogin 시도
      try {
        await socialLoginNotifier.login();
        debugPrint(ref.watch(socialLoginController).token);
        debugPrint(ref.watch(socialLoginController).isLogined.toString());
      } catch (err) {
        debugPrint("socialLoginNotifier : ${err.toString()}");
      }

      /// socialLogin이 되었다면
      if (ref.watch(socialLoginController).isLogined) {
        try {
          switch (loginOption) {
            case LoginOption.google:
              await maeumgagymLoginNotifier
                  .googleLogin(ref.watch(socialLoginController).token);

            case LoginOption.kakao:
              await maeumgagymLoginNotifier
                  .kakaoLogin(ref.watch(socialLoginController).token);
          }
        } catch (err) {
          if (context.mounted && err.toString().contains('404')) {
            await context.push('/signUpAgree');

            await socialLoginNotifier.logout();
          } else {
            debugPrint(err.toString());
          }
        }
        if (ref.watch(maeumgagymLoginController).stateusCode == 200 &&
            context.mounted) {
          context.go('/home');
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 150,
                height: MediaQuery.of(context).size.width - 150,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 30),
            PtdTextWidget.titleMedium('이제 헬창이 되어보세요!', MaeumgagymColor.black),
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
                  image: 'assets/image/on_boarding_icon/kakao_talk_logo.svg',
                  title: '카카오로 로그인',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
