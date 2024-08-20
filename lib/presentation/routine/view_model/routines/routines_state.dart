import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class RoutinesState<T> {
  BlocStateEnum routinesState;

  T? valueOfNull;
  Object? errorOfNull;

  RoutinesState({
    required this.routinesState,
    this.errorOfNull,
    this.valueOfNull,
  });

  T get value => valueOfNull!;
}

class Empty<T> extends RoutinesState<T> {
  Empty() : super(routinesState: BlocStateEnum.empty);
}

class Loading<T> extends RoutinesState<T> {
  Loading() : super(routinesState: BlocStateEnum.loading);
}

class Error<T> extends RoutinesState<T> {
  Object exception;

  Error({required this.exception})
      : super(routinesState: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded<T> extends RoutinesState<T> {
  T data;

  Loaded({required this.data})
      : super(routinesState: BlocStateEnum.loaded, valueOfNull: data);
}
