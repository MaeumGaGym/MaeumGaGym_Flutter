import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body, floatingActionButton, bottomSheet;
  final Color? backgroundColor;

  const MyScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.bottomSheet,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: appBar,
            body: body,
            floatingActionButton: floatingActionButton,
            bottomSheet: bottomSheet,
          ),
        ),
      ),
    );
  }
}
