import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:styled_widget/styled_widget.dart';

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
    var state = ref.watch(textFieldProvider);

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
                  height: state.onClicked || state.inText ? 54 : 40,
                  alignment: state.onClicked || state.inText
                      ? Alignment.topLeft
                      : Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: state.isError
                            ? MaeumgagymColor.red500
                            : state.onClicked
                                ? MaeumgagymColor.blue500
                                : MaeumgagymColor.gray400,
                      ),
                    ),
                  ),

                  /// LabelText
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 100),
                    style: state.onClicked || state.inText
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
                    child: Text(text).padding(
                      bottom: state.onClicked ? 0 : 8,
                    ),
                  ),
                ),

                /// TextField
                Consumer(
                  builder: (context, ref, child) {
                    return SizedBox(
                      height: 40,
                      child: TextField(
                        controller: controller,
                        onTap: () =>
                            ref.read(textFieldProvider.notifier).clicked(true),
                        onTapOutside: (event) {
                          ref.read(textFieldProvider.notifier).clicked(false);
                          FocusScope.of(context).unfocus();
                        },
                        onChanged: (value) {
                          ref
                              .read(textFieldProvider.notifier)
                              .isText(controller.text.isNotEmpty);
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
                    );
                  },
                )
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
              child: state.isError
                  ? PtdTextWidget.bodyLarge(errorText, MaeumgagymColor.red500)
                  : const Text(''),
            ),
          ),
        ],
      ),
    );
  }
}
