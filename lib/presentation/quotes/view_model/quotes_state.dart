import 'package:maeumgagym_flutter/core/enum/bloc_state_enum.dart';

abstract class QuotesState<T> {
  BlocStateEnum homeState;

  T? valueOfNull;
  Object? errorOfNull;

  T get value => valueOfNull!;

  QuotesState({required this.homeState,this.valueOfNull, this.errorOfNull});
}

class Empty<T> extends QuotesState<T> {
  Empty() : super(homeState: BlocStateEnum.empty);
}

class Loading<T> extends QuotesState<T> {
  Loading() : super(homeState: BlocStateEnum.loading);
}

class Error<T> extends QuotesState<T> {
  Object exception;

  Error({required this.exception})
      : super(
          homeState: BlocStateEnum.error,
          errorOfNull: exception,
        );
}

class Loaded<T> extends QuotesState<T> {
  T data;

  Loaded({required this.data})
      : super(
          homeState: BlocStateEnum.loaded,
          valueOfNull: data,
        );
}
