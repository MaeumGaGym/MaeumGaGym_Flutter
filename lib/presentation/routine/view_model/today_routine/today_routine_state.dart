import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class TodayRoutineState<T> {
  BlocStateEnum todayRoutineState;

  T? valueOfNull;
  Object? errorOfNull;

  TodayRoutineState({
    required this.todayRoutineState,
    this.errorOfNull,
    this.valueOfNull,
  });

  T get value => valueOfNull!;
}

class Empty<T> extends TodayRoutineState<T> {
  Empty() : super(todayRoutineState: BlocStateEnum.empty);
}

class Loading<T> extends TodayRoutineState<T> {
  Loading() : super(todayRoutineState: BlocStateEnum.loading);
}

class Error<T> extends TodayRoutineState<T> {
  Object exception;

  Error({required this.exception})
      : super(todayRoutineState: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded<T> extends TodayRoutineState<T> {
  T data;

  Loaded({required this.data})
      : super(todayRoutineState: BlocStateEnum.loaded, valueOfNull: data);
}
