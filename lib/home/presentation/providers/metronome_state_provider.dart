import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maeum_ga_gym_flutter/home/presentation/models/metronome.dart';

final metronomeController =
    StateNotifierProvider<MetronomeStateNotifier, Metronome>(
        (ref) => MetronomeStateNotifier());

class MetronomeStateNotifier extends StateNotifier<Metronome> {
  Timer? _timer;
  final player = AudioPlayer();

  MetronomeStateNotifier()
      : super(
    /// 초기값 설정
          Metronome(
            volume: 10,
            initialBeat: 5,
            currentBeat: 1,
            bpm: 120,
            onVibration: false,
            onPlay: false,
            onVolume: false,
          ),
        );

  /// 오디오 실행
  void onPlay() {
    /// 상태 변경
    state = state.copyWith(onPlay: true);

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
      state = state.copyWith(currentBeat: 1); // currentBeat를 먼저 업데이트
    } else {
      state = state.copyWith(currentBeat: state.currentBeat + 1);
    }

    /// 햅틱 설정
    if (state.onVibration) {
      state.currentBeat == 1
          ? await HapticFeedback.heavyImpact()
          : await HapticFeedback.lightImpact();
    }

    /// 오디오 재생
    await player.play(AssetSource(state.currentBeat == 1
        ? "sounds/metronome/High.wav"
        : "sounds/metronome/Low.wav")); // 업데이트 된 currentBeat에 따라 소리 재생
  }

  /// 오디오 정지
  void onPause() {
    /// 타이머 정지
    _timer?.cancel();

    /// 상태 초기화
    state = state.copyWith(onPlay: false);

    /// 1로 초기화하면 최초 실행 때 이미 한번 실행된 걸로 간주되어 4번만 실행됨
    state = state.copyWith(currentBeat: 0);
  }

  /// 진동 온오프 설정
  void onVibration() {
    if (state.onVibration) {
      state = state.copyWith(onVibration: false);
    } else {
      state = state.copyWith(onVibration: true);
    }
  }

  /// 볼륨 설정 위젯 온오프 설정
  void onVolume() {
    if (state.onVolume) {
      state = state.copyWith(onVolume: false);
    } else {
      state = state.copyWith(onVolume: true);
    }
  }

  /// 버튼으로 BPM 증가
  void increaseBpm() {
    if (state.bpm < 300) {
      /// bpm이 300 이상이 되지 않도록
      state = state.copyWith(bpm: state.bpm + 1);
      state = state.copyWith(currentBeat: 0);
    }
  }

  /// 버튼으로 BPM 감소
  void decreaseBpm() {
    if (state.bpm > 1) {
      /// bpm이 음수가 되지 않도록
      state = state.copyWith(bpm: state.bpm - 1);
      state = state.copyWith(currentBeat: 0);
    }
  }

  /// 비트수 변경
  void changeBeat(int value) {
    state = state.copyWith(initialBeat: value);
    state = state.copyWith(currentBeat: 0);
  }

  /// Slider로 BPM 값 변경
  void changeBpm(int value) {
    state = state.copyWith(bpm: value);
    state = state.copyWith(currentBeat: 0);
  }

  /// Slider로 Volume 값 변경
  void setVolume(int value) async {
    state = state.copyWith(volume: value);
    /// Slider의 value는 double타입임
    await player.setVolume(state.volume.toDouble());
  }
}
