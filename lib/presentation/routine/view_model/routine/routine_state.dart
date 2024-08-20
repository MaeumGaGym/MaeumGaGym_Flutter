import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class RoutineState<T> {
  BlocStateEnum routineState;

  T? valueOfNull;
  Object? errorOfNull;

  RoutineState({
    required this.routineState,
    this.errorOfNull,
    this.valueOfNull,
  });

  T get value => valueOfNull!;
}

class Empty<T> extends RoutineState<T> {
  Empty() : super(routineState: BlocStateEnum.empty);
}

class Loading<T> extends RoutineState<T> {
  Loading() : super(routineState: BlocStateEnum.loading);
}

class Error<T> extends RoutineState<T> {
  Object exception;

  Error({required this.exception})
      : super(routineState: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded<T> extends RoutineState<T> {
  T data;

  Loaded({required this.data})
      : super(routineState: BlocStateEnum.loaded, valueOfNull: data);
}
