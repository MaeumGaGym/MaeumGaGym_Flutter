import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final metronomeBpmProvider = StateProvider<int>((ref) => 120);

final metronomeAudioProvider = StateProvider<AudioPlayer>((ref) => AudioPlayer());

final metronomeVolumeProvider = StateProvider<double>((ref) => 0);

final metronomeBeatProvider = StateProvider<int>((ref) => 1);

final metronomeStateProvider = StateProvider<bool>((ref) => false);
// false => 플레이 중 x , true => 플레이 중

