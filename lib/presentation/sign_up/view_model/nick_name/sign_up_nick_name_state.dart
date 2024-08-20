import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class SignUpNickNameState<T> {
  BlocStateEnum signUpNickNameState;

  T? valueOfNull;
  Object? errorOfNull;

  SignUpNickNameState({
    required this.signUpNickNameState,
    this.valueOfNull,
    this.errorOfNull,
  });

  T get value => valueOfNull!;
}

class Empty<T> extends SignUpNickNameState<T> {
  Empty() : super(signUpNickNameState: BlocStateEnum.empty);
}

class Loading<T> extends SignUpNickNameState<T> {
  Loading() : super(signUpNickNameState: BlocStateEnum.loading);
}

class Error<T> extends SignUpNickNameState<T> {
  Object exception;

  Error({
    required this.exception,
  }) : super(
          signUpNickNameState: BlocStateEnum.error,
          errorOfNull: exception,
        );
}

class Loaded<T> extends SignUpNickNameState<T> {
  T data;

  Loaded({
    required this.data,
  }) : super(
          signUpNickNameState: BlocStateEnum.loaded,
          valueOfNull: data,
        );
}