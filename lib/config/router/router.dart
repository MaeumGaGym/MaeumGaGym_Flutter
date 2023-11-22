import 'package:go_router/go_router.dart';

import 'package:wewith_flutter/presentation/on_boarding_screen/on_boarding_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, state) => const OnBoardingScreen(),
    ),
  ],
);
