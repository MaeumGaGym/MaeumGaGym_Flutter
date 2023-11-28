import 'package:flutter/material.dart';

class TextFieldControlProvider extends ChangeNotifier {
  bool _textFieldState = false;
  bool _isText = false;

  bool get textFieldState => _textFieldState;

  bool get isText => _isText;

  void onClick(bool state) {
    _textFieldState = state;
    notifyListeners();
  }

  void isNotEmptyText(bool state) {
    _isText = state;
    notifyListeners();
  }
}
