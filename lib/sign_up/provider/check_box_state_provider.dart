import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkBoxProvider =
    StateNotifierProvider<CheckBoxStateNotifier, CheckBoxState>((ref) {
  return CheckBoxStateNotifier();
});

class CheckBoxStateNotifier extends StateNotifier<CheckBoxState> {
  CheckBoxStateNotifier()
      : super(CheckBoxState(
          allAgree: false,
          agreePersonInformation: false,
          agreeConditionsOfUse: false,
          moreThanAgeFourteen: false,
          agreeMarketingInformation: false,
        ));

  void checkAllAgree() async {
    if (state.agreePersonInformation &&
        state.agreeConditionsOfUse &&
        state.moreThanAgeFourteen &&
        state.agreeMarketingInformation) {
      state = CheckBoxState(
        allAgree: true,
        agreePersonInformation: state.agreePersonInformation,
        agreeConditionsOfUse: state.agreeConditionsOfUse,
        moreThanAgeFourteen: state.moreThanAgeFourteen,
        agreeMarketingInformation: state.agreeMarketingInformation,
      );
    } else {
      state = CheckBoxState(
        allAgree: false,
        agreePersonInformation: state.agreePersonInformation,
        agreeConditionsOfUse: state.agreeConditionsOfUse,
        moreThanAgeFourteen: state.moreThanAgeFourteen,
        agreeMarketingInformation: state.agreeMarketingInformation,
      );
    }
  }

  void clickAllAgree() async {
    if (state.allAgree) {
      state = CheckBoxState(
        allAgree: false,
        agreePersonInformation: false,
        agreeConditionsOfUse: false,
        moreThanAgeFourteen: false,
        agreeMarketingInformation: false,
      );
    } else {
      state = CheckBoxState(
        allAgree: true,
        agreePersonInformation: true,
        agreeConditionsOfUse: true,
        moreThanAgeFourteen: true,
        agreeMarketingInformation: true,
      );
    }
  }

  void clickAgreePersonInformation() async {
    state = CheckBoxState(
      allAgree: state.allAgree,
      agreePersonInformation: !state.agreePersonInformation,
      agreeConditionsOfUse: state.agreeConditionsOfUse,
      moreThanAgeFourteen: state.moreThanAgeFourteen,
      agreeMarketingInformation: state.agreeMarketingInformation,
    );
  }

  void clickAgreeConditionsOfUse() {
    state = CheckBoxState(
      allAgree: state.allAgree,
      agreePersonInformation: state.agreePersonInformation,
      agreeConditionsOfUse: !state.agreeConditionsOfUse,
      moreThanAgeFourteen: state.moreThanAgeFourteen,
      agreeMarketingInformation: state.agreeMarketingInformation,
    );
  }

  void clickMoreThanAgeFourteen() {
    state = CheckBoxState(
      allAgree: state.allAgree,
      agreePersonInformation: state.agreePersonInformation,
      agreeConditionsOfUse: state.agreeConditionsOfUse,
      moreThanAgeFourteen: !state.moreThanAgeFourteen,
      agreeMarketingInformation: state.agreeMarketingInformation,
    );
  }

  void clickAgreeMarketingInformation() {
    state = CheckBoxState(
      allAgree: state.allAgree,
      agreePersonInformation: state.agreePersonInformation,
      agreeConditionsOfUse: state.agreeConditionsOfUse,
      moreThanAgeFourteen: state.moreThanAgeFourteen,
      agreeMarketingInformation: !state.agreeMarketingInformation,
    );
  }
}

class CheckBoxState {
  final bool allAgree;
  final bool agreePersonInformation;
  final bool agreeConditionsOfUse;
  final bool moreThanAgeFourteen;
  final bool agreeMarketingInformation;

  CheckBoxState({
    required this.allAgree,
    required this.agreePersonInformation,
    required this.agreeConditionsOfUse,
    required this.moreThanAgeFourteen,
    required this.agreeMarketingInformation,
  });
}
