import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 48.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => context.go('/home'),
              child: SvgPicture.asset('assets/image/home_icon.svg'),
            ),
            GestureDetector(
              child: SvgPicture.asset('assets/image/pose_icon.svg'),
            ),
            GestureDetector(
              child: SvgPicture.asset('assets/image/arm_icon.svg'),
            ),
            GestureDetector(
              child: SvgPicture.asset('assets/image/pickle_icon.svg'),
            ),
            GestureDetector(
              child: SvgPicture.asset('assets/image/cart_icon.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
