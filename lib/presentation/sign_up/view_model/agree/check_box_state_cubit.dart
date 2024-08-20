import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/presentation/sign_up/view_model/agree/check_box_state_model.dart';

class CheckBoxStateCubit extends Cubit<CheckBoxStateModel> {
  CheckBoxStateCubit()
      : super(
          CheckBoxStateModel(
            agreeOk: false,
            allAgree: false,
            personInformation: false,
            conditionsOfUse: false,
            moreThanAgeFourteen: false,
            marketingInformation: false,
          ),
        );

  void clickAllAgree() {
    if (state.allAgree) {
      emit(CheckBoxStateModel(
        agreeOk: false,
        allAgree: false,
        personInformation: false,
        conditionsOfUse: false,
        moreThanAgeFourteen: false,
        marketingInformation: false,
      ));
    } else {
      emit(CheckBoxStateModel(
        agreeOk: true,
        allAgree: true,
        personInformation: true,
        conditionsOfUse: true,
        moreThanAgeFourteen: true,
        marketingInformation: true,
      ));
    }
  }

  void clickPersonInformation() => emit(
        state.copyWith(
          personInformation: !state.personInformation,
          agreeOk: !state.personInformation &&
              state.conditionsOfUse &&
              state.moreThanAgeFourteen &&
              state.marketingInformation,
          allAgree: !state.personInformation &&
              state.conditionsOfUse &&
              state.moreThanAgeFourteen,
        ),
      );

  void clickConditionsOfUse() => emit(
        state.copyWith(
          conditionsOfUse: !state.conditionsOfUse,
          agreeOk: state.personInformation &&
              !state.conditionsOfUse &&
              state.moreThanAgeFourteen &&
              state.marketingInformation,
          allAgree: state.personInformation &&
              !state.conditionsOfUse &&
              state.moreThanAgeFourteen,
        ),
      );

  void clickMoreThanAgeFourteen() => emit(
        state.copyWith(
          moreThanAgeFourteen: !state.moreThanAgeFourteen,
          agreeOk: state.personInformation &&
              state.conditionsOfUse &&
              !state.moreThanAgeFourteen &&
              state.marketingInformation,
          allAgree: state.personInformation &&
              state.conditionsOfUse &&
              !state.moreThanAgeFourteen,
        ),
      );

  void clickMarketingInformation() => emit(
        state.copyWith(
          marketingInformation: !state.marketingInformation,
          agreeOk: state.personInformation &&
              state.conditionsOfUse &&
              state.moreThanAgeFourteen &&
              !state.marketingInformation,
          allAgree: state.personInformation &&
              state.conditionsOfUse &&
              state.moreThanAgeFourteen,
        ),
      );
}
