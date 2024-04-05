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
      state = state.copyWith(allAgree: true);
    } else {
      state = state.copyWith(allAgree: false);
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
    state =
        state.copyWith(agreePersonInformation: !state.agreePersonInformation);
  }

  void clickAgreeConditionsOfUse() {
    state = state.copyWith(agreeConditionsOfUse: !state.agreeConditionsOfUse);
  }

  void clickMoreThanAgeFourteen() {
    state = state.copyWith(moreThanAgeFourteen: !state.moreThanAgeFourteen);
  }

  void clickAgreeMarketingInformation() {
    state = state.copyWith(
        agreeMarketingInformation: !state.agreeMarketingInformation);
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

  CheckBoxState copyWith({
    bool? allAgree,
    bool? agreePersonInformation,
    bool? agreeConditionsOfUse,
    bool? moreThanAgeFourteen,
    bool? agreeMarketingInformation,
  }) {
    return CheckBoxState(
      allAgree: allAgree ?? this.allAgree,
      agreePersonInformation:
          agreePersonInformation ?? this.agreePersonInformation,
      agreeConditionsOfUse: agreeConditionsOfUse ?? this.agreeConditionsOfUse,
      moreThanAgeFourteen: moreThanAgeFourteen ?? this.moreThanAgeFourteen,
      agreeMarketingInformation:
          agreeMarketingInformation ?? this.agreeMarketingInformation,
    );
  }
}
