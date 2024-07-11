import 'package:audioplayers/audioplayers.dart';

final _audioPlayer = AudioPlayer();

class TimerSoundComponent {
  static void timerPlay(){
    _audioPlayer.play(AssetSource('sounds/timer/timer_end_sound.wav'));
  }
}