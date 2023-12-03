import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wewith_flutter/presentation/home_screen/home_screen.dart';

import 'package:wewith_flutter/presentation/on_boarding_screen/on_boarding_screen.dart';
import 'package:wewith_flutter/presentation/signup_screen/signup_agree_screen.dart';
import 'package:wewith_flutter/presentation/signup_screen/signup_nickname_screen.dart';
import 'package:wewith_flutter/presentation/signup_screen/signup_success_screen.dart';

CustomTransitionPage pageAnimation(Widget page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => pageAnimation(const OnBoardingScreen()),
      routes: [
        GoRoute(
          path: 'signupAgree',
          pageBuilder: (_, state) => pageAnimation(const SignUpAgreeScreen()),
          routes: [
            GoRoute(
              path: 'signupNickname',
              pageBuilder: (context, state) => pageAnimation(
                const SignUpNickNameScreen(),
              ),
              routes: [
                GoRoute(
                  path: 'signupSuccess',
                  pageBuilder: (context, state) => pageAnimation(
                    const SignUpSuccessScreen(),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    )
  ],
);
