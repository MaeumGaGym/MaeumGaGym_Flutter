import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class PurposeState<T> {
  BlocStateEnum purposeState;

  T? valueOfNull;
  Object? errorOfNull;

  PurposeState({
    required this.purposeState,
    this.errorOfNull,
    this.valueOfNull,
  });

  T get value => valueOfNull!;
}

class Empty<T> extends PurposeState<T> {
  Empty() : super(purposeState: BlocStateEnum.empty);
}

class Loading<T> extends PurposeState<T> {
  Loading() : super(purposeState: BlocStateEnum.loading);
}

class Error<T> extends PurposeState<T> {
  Object exception;

  Error({required this.exception})
      : super(purposeState: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded<T> extends PurposeState<T> {
  T data;

  Loaded({required this.data})
      : super(purposeState: BlocStateEnum.loaded, valueOfNull: data);
}
