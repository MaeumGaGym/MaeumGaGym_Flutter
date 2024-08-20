import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class MaeumAuthState<T> {
  BlocStateEnum maeumAuthLoginState;

  T? valueOfNull;
  Object? errorOfNull;

  MaeumAuthState({
    required this.maeumAuthLoginState,
    this.valueOfNull,
    this.errorOfNull,
  });

  T get value => valueOfNull!;

  Object get error => errorOfNull!;
}

class Empty<T> extends MaeumAuthState<T> {
  Empty() : super(maeumAuthLoginState: BlocStateEnum.empty);
}

class Loading<T> extends MaeumAuthState<T> {
  Loading() : super(maeumAuthLoginState: BlocStateEnum.loading);
}

class Error<T> extends MaeumAuthState<T> {
  T? data;
  Object exception;

  Error({required this.exception, this.data})
      : super(
          maeumAuthLoginState: BlocStateEnum.error,
          errorOfNull: exception,
          valueOfNull: data,
        );
}

class Loaded<T> extends MaeumAuthState<T> {
  Loaded(): super(maeumAuthLoginState: BlocStateEnum.loaded);
}
