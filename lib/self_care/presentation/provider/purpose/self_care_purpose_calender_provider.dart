import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:maeum_ga_gym_flutter/self_care/presentation/widget/purpose/self_care_purpose_calender_widget.dart';

final selfCarePurposeStartCalenderProvider =
    StateNotifierProvider<SelfCarePurposeCalenderStateNotifier, CalenderModel>(
  (ref) => SelfCarePurposeCalenderStateNotifier(),
);

final selfCarePurposeEndCalenderProvider =
    StateNotifierProvider<SelfCarePurposeCalenderStateNotifier, CalenderModel>(
  (ref) => SelfCarePurposeCalenderStateNotifier(),
);

class SelfCarePurposeCalenderStateNotifier
    extends StateNotifier<CalenderModel> {
  SelfCarePurposeCalenderStateNotifier()
      : super(CalenderModel(
          isActive: false,
          overlay: null,
          date: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ),
        ));

  void overlayRemove() {
    state.overlay!.remove();
    state = state.copyWith(isActive: false, overlay: null);
  }

  void overlayCalenderInset({
    required BuildContext context,
    required SelfCarePurposeCalenderStateNotifier notifier,
  }) {
    state = state.copyWith(
      isActive: true,
      overlay: OverlayEntry(
        builder: (_) => SelfCarePurposeCalenderWidget(
          link: state.calenderLayerLink,
          selectedDate: state.date,
          notifier: notifier,
        ),
      ),
    );

    Navigator.of(context).overlay!.insert(state.overlay!);
  }

  void saveDate({required DateTime date}) {
    state = state.copyWith(date: date);
  }

  void calenderDateReset() {
    state = state.copyWith(
      date: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );
  }

  String dateTimeFormat() {
    return DateFormat("yyyy-MM-dd").format(state.date);
  }
}

class CalenderModel {
  final LayerLink calenderLayerLink = LayerLink();
  DateTime date;
  bool isActive;
  OverlayEntry? overlay;

  CalenderModel({
    required this.isActive,
    required this.overlay,
    required this.date,
  });

  CalenderModel copyWith({
    bool? isActive,
    OverlayEntry? overlay,
    DateTime? date,
  }) {
    return CalenderModel(
      isActive: isActive ?? this.isActive,
      overlay: overlay ?? this.overlay,
      date: date ?? this.date,
    );
  }
}
