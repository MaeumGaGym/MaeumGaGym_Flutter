import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class ProfileState<T> {
  BlocStateEnum profileState;

  T? valueOfNull;
  Object? errorOfNull;

  ProfileState({
    required this.profileState,
    this.errorOfNull,
    this.valueOfNull,
  });

  T get value => valueOfNull!;
}

class Empty<T> extends ProfileState<T> {
  Empty() : super(profileState: BlocStateEnum.empty);
}

class Loading<T> extends ProfileState<T> {
  Loading() : super(profileState: BlocStateEnum.loading);
}

class Error<T> extends ProfileState<T> {
  Object exception;

  Error({required this.exception})
      : super(profileState: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded<T> extends ProfileState<T> {
  T data;

  Loaded({required this.data})
      : super(profileState: BlocStateEnum.loaded, valueOfNull: data);
}
