import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class SplashState<T> {
  BlocStateEnum blocStateEnum;

  T? valueOfNull;
  Object? errorOfNull;

  SplashState({
    required this.blocStateEnum,
    this.valueOfNull,
    this.errorOfNull,
  });

  T get value => valueOfNull!;
}

class Empty<T> extends SplashState<T> {
  Empty() : super(blocStateEnum: BlocStateEnum.empty);
}

class Loading<T> extends SplashState<T> {
  Loading() : super(blocStateEnum: BlocStateEnum.loading);
}

class Error<T> extends SplashState<T> {
  Object exception;

  Error({required this.exception})
      : super(blocStateEnum: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded<T> extends SplashState<T> {
  T data;

  Loaded({required this.data})
      : super(blocStateEnum: BlocStateEnum.loaded, valueOfNull: data);
}
