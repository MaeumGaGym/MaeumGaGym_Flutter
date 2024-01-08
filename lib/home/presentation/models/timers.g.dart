// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimersImpl _$$TimersImplFromJson(Map<String, dynamic> json) => _$TimersImpl(
      timerId: json['timerId'] as int,
      initialTime: json['initialTime'] as int,
      timerState:
          $enumDecodeNullable(_$TimerStateEnumMap, json['timerState']) ??
              TimerState.initial,
      currentTime: json['currentTime'] as int,
    );

Map<String, dynamic> _$$TimersImplToJson(_$TimersImpl instance) =>
    <String, dynamic>{
      'timerId': instance.timerId,
      'initialTime': instance.initialTime,
      'timerState': _$TimerStateEnumMap[instance.timerState]!,
      'currentTime': instance.currentTime,
    };

const _$TimerStateEnumMap = {
  TimerState.initial: 'initial',
  TimerState.started: 'started',
  TimerState.paused: 'paused',
};
