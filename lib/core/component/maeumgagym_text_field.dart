import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';

import '../../config/maeumgagym_color.dart';
import '../riverpod/maeumgagym_text_field_riverpod.dart';

class MaeumgagymTextField extends ConsumerWidget {
  final TextEditingController controller;
  final String text, errorText;
  final StateNotifierProvider<TextFieldStateNotifier, TextFieldState>
      textFieldProvider;

  const MaeumgagymTextField(
      {required this.controller,
      required this.text,
      required this.errorText,
      required this.textFieldProvider,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textFieldState = ref.watch(textFieldProvider);
    final textFieldNotifier = ref.read(textFieldProvider.notifier);

    /// 하나로 묶기 위한 SizedBox
    return SizedBox(
      height: 78,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// TextField
          SizedBox(
            height: 54,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                /// LabelText Controller
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: textFieldState.onClicked || textFieldState.inText
                      ? 48
                      : 40,
                  alignment: textFieldState.onClicked || textFieldState.inText
                      ? Alignment.topLeft
                      : Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: textFieldState.isError
                            ? MaeumgagymColor.red500
                            : textFieldState.onClicked
                                ? MaeumgagymColor.blue500
                                : MaeumgagymColor.gray400,
                      ),
                    ),
                  ),

                  /// LabelText
                  child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 100),
                      style: textFieldState.onClicked || textFieldState.inText
                          ? TextStyle(
                              fontFamily: pretendard,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: MaeumgagymColor.gray500,
                            )
                          : TextStyle(
                              fontFamily: pretendard,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: MaeumgagymColor.gray400,
                            ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: textFieldState.onClicked ? 0 : 8),
                        child: Text(text),
                      )),
                ),

                /// TextField
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: controller,
                    onTap: () => textFieldNotifier.clicked(true),
                    onTapOutside: (event) {
                      textFieldNotifier.clicked(false);
                      FocusScope.of(context).unfocus();
                    },
                    onChanged: (value) {
                      textFieldNotifier.isText(controller.text.isNotEmpty);
                    },
                    cursorHeight: 20,
                    cursorWidth: 2,
                    cursorColor: MaeumgagymColor.black,
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontFamily: pretendard,
                      fontSize: 20,
                      height: 1 / 1,
                      fontWeight: FontWeight.w400,
                      color: MaeumgagymColor.black,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GestureDetector(
                        onTap: () {
                          controller.text = '';
                          textFieldNotifier.isText(false);
                          textFieldNotifier.clicked(false);
                        },
                        child: textFieldState.inText &&
                                    textFieldState.onClicked ||
                                textFieldState.inText
                            ? SvgPicture.asset(
                                'assets/image/sign_up_icon/close_circle.svg')
                            : const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// ErrorTexxt
          Container(
            height: 24,
            alignment: Alignment.bottomLeft,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 100),
              style: TextStyle(color: MaeumgagymColor.red500, fontSize: 12),
              child: textFieldState.isError
                  ? PtdTextWidget.bodyLarge(errorText, MaeumgagymColor.red500)
                  : const Text(''),
            ),
          ),
        ],
      ),
    );
  }
}
