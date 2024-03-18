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
    AsyncValue<int?> getRefreshTokenState;
    late String? refreshToken;

    final socialLoginNotifier = ref.read(socialLoginController.notifier);
    final maeumgagymLoginNotifier =
        ref.read(maeumgagymLoginController.notifier);
    final maeumgagymReIssueState = ref.read(maeumgagymReIssueController);
    final maeumgagymReIssueNotifier =
        ref.read(maeumgagymReIssueController.notifier);

    Future<AsyncValue<int?>> getRefreshToken(LoginOption loginOption) async {
      switch (loginOption) {
        case LoginOption.google:
          refreshToken =
              await TokenSecureStorageDi.readGoogleLoginRefreshToken();
          break;
        case LoginOption.kakao:
          refreshToken =
              await TokenSecureStorageDi.readKaKaoLoginRefreshToken();
          break;
        case LoginOption.all:
          break;
      }

      if (refreshToken != null) {
        await maeumgagymReIssueNotifier.getReIssue(refreshToken!, loginOption);

        switch (loginOption) {
          case LoginOption.google:
            return maeumgagymReIssueState.googleAsyncValue;
          case LoginOption.kakao:
            return maeumgagymReIssueState.kakaoAsyncValue;
          case LoginOption.all:
            throw Exception('maeumgagymReIssueState : all');
        }
      } else {
        return const AsyncError('null', StackTrace.empty);
      }
    }

    Future<void> whenSuccessSocialLogin(LoginOption loginOption) async {
      switch (loginOption) {
        case LoginOption.google:
          await maeumgagymLoginNotifier.googleLogin(
            ref.watch(socialLoginController).token!,
          );
          ref.watch(maeumgagymLoginController).googleAsyncValue.when(
                data: (data) async {
                  if (data == 200) {
                    context.go('/home');
                  } else if (data == 404) {
                    await context.push('/signUpAgree');

                    await socialLoginNotifier.logout();
                  }
                },
                error: (err, _) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        scrollable: true,
                        title: const Text('1시간후 다시 시도 하거나, 다른 계정을 사용해주세요.'),
                        content: Text(err.toString()),
                        actions: [
                          MaterialButton(
                            onPressed: () async {
                              await socialLoginNotifier.logout();
                              context.mounted ? context.pop() : '';
                            },
                            child: const Text("확인"),
                          )
                        ],
                      );
                    },
                  );
                  ref.watch(maeumgagymLoginController).googleAsyncValue =
                      const AsyncData(500);
                },
                loading: () {},
              );
          break;

        case LoginOption.kakao:
          await maeumgagymLoginNotifier.kakaoLogin(
            ref.watch(socialLoginController).token!,
          );
          ref.watch(maeumgagymLoginController).kakaoAsyncValue.when(
                data: (data) async {
                  if (data == 200) {
                    context.go('/home');
                  } else if (data == 404) {
                    await context.push('/signUpAgree');

                    await socialLoginNotifier.logout();
                  }
                },
                error: (err, _) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        scrollable: true,
                        title: const Text('1시간후 다시 시도 하거나, 다른 계정을 사용해주세요.'),
                        content: Text(err.toString()),
                        actions: [
                          MaterialButton(
                            onPressed: () async {
                              await socialLoginNotifier.logout();
                              context.mounted ? context.pop() : '';
                            },
                            child: const Text("확인"),
                          )
                        ],
                      );
                    },
                  );
                  ref.watch(maeumgagymLoginController).kakaoAsyncValue =
                      const AsyncData(500);
                },
                loading: () {},
              );
          break;
        case LoginOption.all:
          break;
      }
    }

    Future<void> clickLoginButton(LoginOption loginOption) async {
      ref.read(loginOptionController.notifier).state = loginOption;

      getRefreshTokenState = await getRefreshToken(
        ref.watch(loginOptionController),
      );

      getRefreshTokenState.when(
        data: (data) => context.go('/home'),
        loading: () {},
        error: (_, __) async {
          /// Login Option 설정
          await socialLoginNotifier.setLoginOption(loginOption);

          /// socialLogin 시도
          try {
            await socialLoginNotifier.login(loginOption);
            debugPrint(ref.watch(socialLoginController).token);
          } catch (err) {
            debugPrint("socialLoginNotifier : ${err.toString()}");
          }

          /// socialLogin이 되었다면
          switch (loginOption) {
            case LoginOption.google:
              ref.read(socialLoginController).googleAsyncValue.when(
                    data: (data) => whenSuccessSocialLogin(loginOption),
                    error: (_, __) {},
                    loading: () {},
                  );
              break;
            case LoginOption.kakao:
              ref.read(socialLoginController).kakaoAsyncValue.when(
                    data: (data) => whenSuccessSocialLogin(loginOption),
                    error: (_, __) {},
                    loading: () {},
                  );
              break;
            case LoginOption.all:
              break;
          }
        },
      );
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
                child: Builder(
                  builder: (context) {
                    if (ref
                            .watch(maeumgagymReIssueController)
                            .googleAsyncValue
                            .hasValue &&
                        ref
                            .watch(socialLoginController)
                            .googleAsyncValue
                            .hasValue &&
                        ref
                            .watch(maeumgagymLoginController)
                            .googleAsyncValue
                            .hasValue) {
                      return const OnBoardingContentsWidget(
                        image: 'assets/image/on_boarding_icon/google_logo.svg',
                        title: '구글로 로그인',
                      );
                    } else if (ref
                            .watch(maeumgagymReIssueController)
                            .googleAsyncValue
                            .hasError &&
                        ref
                            .watch(socialLoginController)
                            .googleAsyncValue
                            .hasError &&
                        ref
                            .watch(maeumgagymLoginController)
                            .googleAsyncValue
                            .hasError) {
                      throw Exception('err');
                    } else {
                      return Container(
                        width: MediaQuery.of(context).size.width - 32,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MaeumgagymColor.gray50,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: MaeumgagymColor.blue500,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: GestureDetector(
                onTap: () async {
                  clickLoginButton(LoginOption.kakao);
                },
                child: Builder(
                  builder: (context) {
                    if (ref
                            .watch(maeumgagymReIssueController)
                            .kakaoAsyncValue
                            .hasValue &&
                        ref
                            .watch(socialLoginController)
                            .kakaoAsyncValue
                            .hasValue &&
                        ref
                            .watch(maeumgagymLoginController)
                            .kakaoAsyncValue
                            .hasValue) {
                      return const OnBoardingContentsWidget(
                        image:
                            'assets/image/on_boarding_icon/kakao_talk_logo.svg',
                        title: '카카오로 로그인',
                      );
                    } else if (ref
                            .watch(maeumgagymReIssueController)
                            .kakaoAsyncValue
                            .hasError &&
                        ref
                            .watch(socialLoginController)
                            .kakaoAsyncValue
                            .hasError &&
                        ref
                            .watch(maeumgagymLoginController)
                            .kakaoAsyncValue
                            .hasError) {
                      throw Exception('err');
                    } else {
                      return Container(
                        width: MediaQuery.of(context).size.width - 32,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MaeumgagymColor.gray50,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: MaeumgagymColor.blue500,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
