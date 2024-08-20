import 'package:audioplayers/audioplayers.dart';

final _audioPlayer = AudioPlayer();

class TimerSound {
  static void timerEnd() async {
    await _audioPlayer.play(AssetSource('sounds/timer/timer_end_sound.wav'));
  }
}