import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class PoseRecommendState<T> {
  BlocStateEnum poseRecommendState;

  T? valueOfNull;
  Object? errorOfNull;

  PoseRecommendState({
    required this.poseRecommendState,
    this.valueOfNull,
    this.errorOfNull,
  });

  T get value => valueOfNull!;
}

class Empty<T> extends PoseRecommendState<T> {
  Empty() : super(poseRecommendState: BlocStateEnum.empty);
}

class Loading<T> extends PoseRecommendState<T> {
  Loading() : super(poseRecommendState: BlocStateEnum.loading);
}

class Error<T> extends PoseRecommendState<T> {
  Object exception;

  Error({required this.exception})
      : super(
    poseRecommendState: BlocStateEnum.error,
    errorOfNull: exception,
  );
}

class Loaded<T> extends PoseRecommendState<T> {
  T data;

  Loaded({required this.data})
      : super(
    poseRecommendState: BlocStateEnum.loaded,
    valueOfNull: data,
  );
}
