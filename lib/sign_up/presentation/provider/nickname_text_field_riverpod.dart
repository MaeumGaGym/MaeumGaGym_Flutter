import 'package:flutter_riverpod/flutter_riverpod.dart';

final nicknameTextFieldProvider =
    StateNotifierProvider<TextFieldStateNotifier, TextFieldState>(
        (ref) => TextFieldStateNotifier());

class TextFieldStateNotifier extends StateNotifier<TextFieldState> {
  TextFieldStateNotifier()
      : super(TextFieldState(inText: false, onClicked: false, isError: false));

  void clicked(bool tap) {
    state = TextFieldState(
      inText: state.inText,
      onClicked: tap,
      isError: state.isError,
    );
  }

  void theError(bool tap) {
    state = TextFieldState(
      inText: state.inText,
      onClicked: state.onClicked,
      isError: tap,
    );
  }

  void isText(bool inText) {
    state = TextFieldState(
      inText: inText,
      onClicked: state.onClicked,
      isError: state.isError,
    );
  }
}

class TextFieldState {
  final bool inText, onClicked, isError;

  TextFieldState(
      {required this.inText, required this.onClicked, required this.isError});
}
