import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class PurposesState<T> {
  BlocStateEnum purposesState;

  T? valueOfNull;
  Object? errorOfNull;

  PurposesState({
    required this.purposesState,
    this.errorOfNull,
    this.valueOfNull,
  });

  T get value => valueOfNull!;
}

class Empty<T> extends PurposesState<T> {
  Empty() : super(purposesState: BlocStateEnum.empty);
}

class Loading<T> extends PurposesState<T> {
  Loading() : super(purposesState: BlocStateEnum.loading);
}

class Error<T> extends PurposesState<T> {
  Object exception;

  Error({required this.exception})
      : super(purposesState: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded<T> extends PurposesState<T> {
  T data;

  Loaded({required this.data})
      : super(purposesState: BlocStateEnum.loaded, valueOfNull: data);
}
