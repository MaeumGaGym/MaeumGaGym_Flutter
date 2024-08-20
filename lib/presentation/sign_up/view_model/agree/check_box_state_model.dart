class CheckBoxStateModel {
  final bool agreeOk;
  final bool allAgree;
  final bool personInformation;
  final bool conditionsOfUse;
  final bool moreThanAgeFourteen;
  final bool marketingInformation;

  CheckBoxStateModel({
    required this.agreeOk,
    required this.allAgree,
    required this.personInformation,
    required this.conditionsOfUse,
    required this.moreThanAgeFourteen,
    required this.marketingInformation,
  });

  CheckBoxStateModel copyWith({
    bool? agreeOk,
    bool? allAgree,
    bool? personInformation,
    bool? conditionsOfUse,
    bool? moreThanAgeFourteen,
    bool? marketingInformation,
  }) {
    return CheckBoxStateModel(
      agreeOk: agreeOk ?? this.agreeOk,
      allAgree: allAgree ?? this.allAgree,
      personInformation: personInformation ?? this.personInformation,
      conditionsOfUse: conditionsOfUse ?? this.conditionsOfUse,
      moreThanAgeFourteen: moreThanAgeFourteen ?? this.moreThanAgeFourteen,
      marketingInformation: marketingInformation ?? this.marketingInformation,
    );
  }
}