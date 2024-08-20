import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class PoseDetailState<T> {
  BlocStateEnum poseDetailState;

  T? valueOfNull;
  Object? errorOfNull;

  PoseDetailState({
    required this.poseDetailState,
    this.valueOfNull,
    this.errorOfNull,
  });

  T get value => valueOfNull!;
}

class Empty<T> extends PoseDetailState<T> {
  Empty() : super(poseDetailState: BlocStateEnum.empty);
}

class Loading<T> extends PoseDetailState<T> {
  Loading() : super(poseDetailState: BlocStateEnum.loading);
}

class Error<T> extends PoseDetailState<T> {
  Object exception;

  Error({required this.exception})
      : super(
          poseDetailState: BlocStateEnum.error,
          errorOfNull: exception,
        );
}

class Loaded<T> extends PoseDetailState<T> {
  T data;

  Loaded({required this.data})
      : super(
          poseDetailState: BlocStateEnum.loaded,
          valueOfNull: data,
        );
}
