// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Timers _$TimersFromJson(Map<String, dynamic> json) {
  return _Timers.fromJson(json);
}

/// @nodoc
mixin _$Timers {
  int get timerId => throw _privateConstructorUsedError;
  Duration get initialTime => throw _privateConstructorUsedError;
  TimerState get timerState => throw _privateConstructorUsedError;
  Duration get currentTime => throw _privateConstructorUsedError;
  double get timerValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimersCopyWith<Timers> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimersCopyWith<$Res> {
  factory $TimersCopyWith(Timers value, $Res Function(Timers) then) =
      _$TimersCopyWithImpl<$Res, Timers>;
  @useResult
  $Res call(
      {int timerId,
      Duration initialTime,
      TimerState timerState,
      Duration currentTime,
      double timerValue});
}

/// @nodoc
class _$TimersCopyWithImpl<$Res, $Val extends Timers>
    implements $TimersCopyWith<$Res> {
  _$TimersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerId = null,
    Object? initialTime = null,
    Object? timerState = null,
    Object? currentTime = null,
    Object? timerValue = null,
  }) {
    return _then(_value.copyWith(
      timerId: null == timerId
          ? _value.timerId
          : timerId // ignore: cast_nullable_to_non_nullable
              as int,
      initialTime: null == initialTime
          ? _value.initialTime
          : initialTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      timerState: null == timerState
          ? _value.timerState
          : timerState // ignore: cast_nullable_to_non_nullable
              as TimerState,
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      timerValue: null == timerValue
          ? _value.timerValue
          : timerValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimersImplCopyWith<$Res> implements $TimersCopyWith<$Res> {
  factory _$$TimersImplCopyWith(
          _$TimersImpl value, $Res Function(_$TimersImpl) then) =
      __$$TimersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int timerId,
      Duration initialTime,
      TimerState timerState,
      Duration currentTime,
      double timerValue});
}

/// @nodoc
class __$$TimersImplCopyWithImpl<$Res>
    extends _$TimersCopyWithImpl<$Res, _$TimersImpl>
    implements _$$TimersImplCopyWith<$Res> {
  __$$TimersImplCopyWithImpl(
      _$TimersImpl _value, $Res Function(_$TimersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerId = null,
    Object? initialTime = null,
    Object? timerState = null,
    Object? currentTime = null,
    Object? timerValue = null,
  }) {
    return _then(_$TimersImpl(
      timerId: null == timerId
          ? _value.timerId
          : timerId // ignore: cast_nullable_to_non_nullable
              as int,
      initialTime: null == initialTime
          ? _value.initialTime
          : initialTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      timerState: null == timerState
          ? _value.timerState
          : timerState // ignore: cast_nullable_to_non_nullable
              as TimerState,
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      timerValue: null == timerValue
          ? _value.timerValue
          : timerValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimersImpl implements _Timers {
  _$TimersImpl(
      {required this.timerId,
      required this.initialTime,
      this.timerState = TimerState.initial,
      required this.currentTime,
      required this.timerValue});

  factory _$TimersImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimersImplFromJson(json);

  @override
  final int timerId;
  @override
  final Duration initialTime;
  @override
  @JsonKey()
  final TimerState timerState;
  @override
  final Duration currentTime;
  @override
  final double timerValue;

  @override
  String toString() {
    return 'Timers(timerId: $timerId, initialTime: $initialTime, timerState: $timerState, currentTime: $currentTime, timerValue: $timerValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimersImpl &&
            (identical(other.timerId, timerId) || other.timerId == timerId) &&
            (identical(other.initialTime, initialTime) ||
                other.initialTime == initialTime) &&
            (identical(other.timerState, timerState) ||
                other.timerState == timerState) &&
            (identical(other.currentTime, currentTime) ||
                other.currentTime == currentTime) &&
            (identical(other.timerValue, timerValue) ||
                other.timerValue == timerValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, timerId, initialTime, timerState, currentTime, timerValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimersImplCopyWith<_$TimersImpl> get copyWith =>
      __$$TimersImplCopyWithImpl<_$TimersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimersImplToJson(
      this,
    );
  }
}

abstract class _Timers implements Timers {
  factory _Timers(
      {required final int timerId,
      required final Duration initialTime,
      final TimerState timerState,
      required final Duration currentTime,
      required final double timerValue}) = _$TimersImpl;

  factory _Timers.fromJson(Map<String, dynamic> json) = _$TimersImpl.fromJson;

  @override
  int get timerId;
  @override
  Duration get initialTime;
  @override
  TimerState get timerState;
  @override
  Duration get currentTime;
  @override
  double get timerValue;
  @override
  @JsonKey(ignore: true)
  _$$TimersImplCopyWith<_$TimersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
