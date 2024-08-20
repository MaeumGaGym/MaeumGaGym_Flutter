import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class PoseAllState<T> {
  BlocStateEnum poseAllState;

  T? valueOfNull;
  Object? errorOfNull;

  PoseAllState({
    required this.poseAllState,
    this.valueOfNull,
    this.errorOfNull,
  });

  T get value => valueOfNull!;
}

class Empty<T> extends PoseAllState<T> {
  Empty() : super(poseAllState: BlocStateEnum.empty);
}

class Loading<T> extends PoseAllState<T> {
  Loading() : super(poseAllState: BlocStateEnum.loading);
}

class Error<T> extends PoseAllState<T> {
  Object exception;

  Error({required this.exception})
      : super(
          poseAllState: BlocStateEnum.error,
          errorOfNull: exception,
        );
}

class Loaded<T> extends PoseAllState<T> {
  T data;

  Loaded({required this.data})
      : super(
          poseAllState: BlocStateEnum.loaded,
          valueOfNull: data,
        );
}
