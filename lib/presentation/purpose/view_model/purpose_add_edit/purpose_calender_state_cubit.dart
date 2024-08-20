import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maeumgagym_flutter/presentation/purpose/view_model/purpose_add_edit/purpose_calender_model.dart';

import '../../ui/widget/purpose_add_edit/purpose_add_edit_calender_widget.dart';

class PurposeStartCalender extends PurposeCalenderStateCubit {}

class PurposeEndCalender extends PurposeCalenderStateCubit{}

class PurposeCalenderStateCubit extends Cubit<PurposeCalenderModel>{
  PurposeCalenderStateCubit()
      : super(
          PurposeCalenderModel(
            isActive: false,
            overlay: null,
            date: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            ),
          ),
        );

  void overlayCalenderInset({required BuildContext context}) {
    emit(
      state.copyWith(
        isActive: true,
        overlay: OverlayEntry(
          builder: (_) => PurposeAddEditCalenderWidget(
            link: state.calenderLayerLink,
            selectedDate: state.date,
            saveDate: saveDate,
            removeCalender: overlayRemove,
          ),
        ),
      ),
    );

    Navigator.of(context).overlay!.insert(state.overlay!);
  }

  void saveDate({required DateTime date}) {
    emit(state.copyWith(date: date));
  }

  void overlayRemove() {
    state.overlay!.remove();
    emit(state.copyWith(isActive: false, overlay: null));
  }

  void calenderDateReset() {
    emit(state.copyWith(
      date: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
    ));
  }

  String dateTimeFormat() {
    return DateFormat("yyyy-MM-dd").format(state.date);
  }
}