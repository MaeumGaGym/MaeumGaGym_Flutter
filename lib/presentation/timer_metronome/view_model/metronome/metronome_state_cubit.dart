import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/domain/metronome/entity/metronome_entity.dart';

class MetronomeStateCubit extends Cubit<MetronomeEntity> {
  Timer? _timer;
  final playerHigh = AudioPlayer();
  final playerLow = AudioPlayer();

  MetronomeStateCubit()
      : super(
          MetronomeEntity(
            volume: 10,
            initialBeat: 5,
            currentBeat: 1,
            bpm: 120,
            onVibration: false,
            onPlay: false,
            onVolume: false,
            onBackGround: true,
          ),
        );

  /// 오디오 실행
  void onPlay() {
    /// 상태 변경
    emit(state.copyWith(onPlay: true));

    /// 처음 BPM동안 쉬고 들어가는 현상을 방지
    playSound();

    /// BPM 계산식을 이용해서 오디오 재생
    _timer = Timer.periodic(
        Duration(milliseconds: (60 / state.bpm * 1000).round()), (_) {
      playSound();
    });
  }

  /// 오디오 플레이 설정
  void playSound() async {
    if (state.currentBeat >= state.initialBeat) {
      /// 기본값 1로 초기화
      emit(state.copyWith(currentBeat: 1));
    } else {
      emit(state.copyWith(currentBeat: state.currentBeat + 1));
    }

    /// 햅틱 설정
    if (state.onVibration) {
      state.currentBeat == 1
          ? await HapticFeedback.heavyImpact()
          : await HapticFeedback.lightImpact();
    }

    /// 오디오 재생
    state.currentBeat == 1
        ? await playerHigh.play(AssetSource("sounds/metronome/high.wav"))
        : await playerLow.play(AssetSource("sounds/metronome/low.wav"));
  }

  /// 오디오 정지
  void onPause() {
    /// 타이머 정지
    _timer?.cancel();

    /// 상태 초기화
    emit(state.copyWith(onPlay: false));

    /// 1로 초기화하면 최초 실행 때 이미 한번 실행된 걸로 간주되어 4번만 실행됨
    emit(state.copyWith(currentBeat: 0));
  }

  /// 진동 온오프 설정
  void onVibration() {
    if (state.onVibration) {
      emit(state.copyWith(onVibration: false));
    } else {
      emit(state.copyWith(onVibration: true));
    }
  }

  /// 볼륨 설정 위젯 온오프 설정
  void onVolume() {
    if (state.onVolume) {
      emit(state.copyWith(onVolume: false));
    } else {
      emit(state.copyWith(onVolume: true));
    }
  }

  /// 버튼으로 BPM 증가
  void increaseBpm() {
    if (state.bpm < 300) {
      /// bpm이 300 이상이 되지 않도록
      emit(state.copyWith(bpm: state.bpm + 1, currentBeat: 0));
    }
  }

  /// 버튼으로 BPM 감소
  void decreaseBpm() {
    if (state.bpm > 1) {
      /// bpm이 음수가 되지 않도록
      emit(state.copyWith(bpm: state.bpm - 1, currentBeat: 0));
    }
  }

  /// 비트수 변경
  void changeBeat(int value) {
    emit(state.copyWith(initialBeat: value, currentBeat: 0));
  }

  /// Slider로 BPM 값 변경
  void changeBpm(int value) {
    emit(state.copyWith(bpm: value, currentBeat: 0));
  }

  /// Slider로 Volume 값 변경
  void setVolume(int value) async {
    emit(state.copyWith(volume: value));

    /// Slider의 value는 double타입임
    await playerHigh.setVolume(state.volume / 10);
    await playerLow.setVolume(state.volume / 10);
  }

  /// 백그라운드 설정
  void changeBackGround() async {
    if (state.onBackGround == true) {
      emit(state.copyWith(onBackGround: false));
      await playerHigh.setReleaseMode(ReleaseMode.stop);
      await playerLow.setReleaseMode(ReleaseMode.stop);
    } else {
      emit(state.copyWith(onBackGround: true));
      await playerHigh.setReleaseMode(ReleaseMode.release);
      await playerLow.setReleaseMode(ReleaseMode.release);
    }
  }
}