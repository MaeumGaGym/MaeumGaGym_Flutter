import 'package:flutter/material.dart';

class CheckBoxWidgetProvider extends ChangeNotifier {
  bool _allCheck = false;
  bool _agreePersonInformation = false;
  bool _agreeConditionsOfUse = false;
  bool _moreThanAgeFourteen = false;
  bool _agreeMarketingInformation = false;

  bool get allCheck => _allCheck;

  bool get agreePersonInformation => _agreePersonInformation;

  bool get agreeConditionsOfUse => _agreeConditionsOfUse;

  bool get moreThanAgeFourteen => _moreThanAgeFourteen;

  bool get agreeMarketingInformation => _agreeMarketingInformation;

  void clickAllCheck() {
    if (_allCheck == true) {
      _allCheck = false;
      _agreePersonInformation = false;
      _agreeConditionsOfUse = false;
      _moreThanAgeFourteen = false;
      _agreeMarketingInformation = false;
    } else {
      _allCheck = true;
      _agreePersonInformation = true;
      _agreeConditionsOfUse = true;
      _moreThanAgeFourteen = true;
      _agreeMarketingInformation = true;
    }
    notifyListeners();
  }

  void clickAgreePersonInformation() {
    if (_agreePersonInformation == true) {
      _agreePersonInformation = false;
    } else {
      _agreePersonInformation = true;
    }
    notifyListeners();
  }

  void clickAgreeConditionsOfUse() {
    if (_agreeConditionsOfUse == true) {
      _agreeConditionsOfUse = false;
    } else {
      _agreeConditionsOfUse = true;
    }
    notifyListeners();
  }

  void clickMoreThanAgeFourteen() {
    if (_moreThanAgeFourteen == true) {
      _moreThanAgeFourteen = false;
    } else {
      _moreThanAgeFourteen = true;
    }
    notifyListeners();
  }

  void clickAgreeMarketingInformation() {
    if (_agreeMarketingInformation == true) {
      _agreeMarketingInformation = false;
    } else {
      _agreeMarketingInformation = true;
    }
    notifyListeners();
  }

  void checkAll() {
    if (_agreePersonInformation == true &&
        _agreeConditionsOfUse == true &&
        _moreThanAgeFourteen == true &&
        _agreeMarketingInformation == true) {
      _allCheck = true;
    } else if (_agreePersonInformation == false ||
        _agreeConditionsOfUse == false ||
        _moreThanAgeFourteen == false ||
        _agreeMarketingInformation == false) {
      _allCheck = false;
    }
  }
}
