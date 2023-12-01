import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../presentation/signup_screen/provider/provider/textfield_control_provider.dart';
import '../constant/maeumgagym_color.dart';

bool floatingLabelText(textFieldState, isText) {
  if (!textFieldState && !isText) {
    return false;
  }
  return true;
}

class MaeumGaGymTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const MaeumGaGymTextField(
      {required this.text, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Consumer<TextFieldControlProvider>(
            builder: (context, provider, child) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height:
                    floatingLabelText(provider.textFieldState, provider.isText)
                        ? 70.h
                        : 66.h,
                alignment:
                    floatingLabelText(provider.textFieldState, provider.isText)
                        ? Alignment.topLeft
                        : Alignment.centerLeft,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 100),
                  style: floatingLabelText(
                          provider.textFieldState, provider.isText)
                      ? TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: MaeumGaGymColor.gray500,
                        )
                      : TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: MaeumGaGymColor.gray400,
                        ),
                  child: Text(text),
                ),
              );
            },
          ),
          Consumer<TextFieldControlProvider>(
            builder: (context, provider, child) {
              return SizedBox(
                height: 70.h,
                child: TextField(
                  // controller
                  controller: controller,
                  // button width control ~
                  textInputAction: TextInputAction.go,
                  onSubmitted: (value) => provider.onClick(false),
                  onTap: () => provider.onClick(true),
                  onTapOutside: (event) {
                    provider.onClick(false);
                    FocusScope.of(context).unfocus();
                  },
                  // button color control
                  onChanged: (String value) {
                    if (controller.text.isNotEmpty) {
                      provider.isNotEmptyText(true);
                    } else {
                      provider.isNotEmptyText(false);
                    }
                  },
                  // decoration
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: MaeumGaGymColor.blue500),
                    ),
                    contentPadding: EdgeInsets.only(top: 10.h),
                  ),
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: MaeumGaGymColor.black,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
