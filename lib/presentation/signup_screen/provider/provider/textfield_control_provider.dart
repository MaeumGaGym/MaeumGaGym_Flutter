import 'package:flutter/material.dart';

class TextFieldControlProvider extends ChangeNotifier {
  bool _textFieldState = false;

  bool get textFieldState => _textFieldState;

  void onClick() {
    if (_textFieldState == false) {
      _textFieldState = true;
    } else {
      _textFieldState = false;
    }
    notifyListeners();
  }
}
