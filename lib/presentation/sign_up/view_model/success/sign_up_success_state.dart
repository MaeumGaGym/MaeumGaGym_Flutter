import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class SignUpSuccessState {
  BlocStateEnum blocStateEnum;
  Object? errorOfNull;

  SignUpSuccessState({
    required this.blocStateEnum,
    this.errorOfNull,
  });
}

class Empty<T> extends SignUpSuccessState {
  Empty() : super(blocStateEnum: BlocStateEnum.empty);
}

class Loading<T> extends SignUpSuccessState {
  Loading() : super(blocStateEnum: BlocStateEnum.loading);
}

class Error<T> extends SignUpSuccessState {
  Object exception;

  Error({required this.exception})
      : super(
          blocStateEnum: BlocStateEnum.error,
          errorOfNull: exception,
        );
}

class Loaded<T> extends SignUpSuccessState {
  Loaded() : super(blocStateEnum: BlocStateEnum.loaded);
}
