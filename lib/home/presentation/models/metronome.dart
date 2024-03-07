class Metronome {
  final int volume;
  final int initialBeat;
  final int currentBeat;
  final int bpm;
  final bool onVibration;
  final bool onPlay;
  final bool onVolume;
  final bool onBackGround;

  Metronome({
    required this.volume,
    required this.initialBeat,
    required this.currentBeat,
    required this.bpm,
    required this.onVibration,
    required this.onPlay,
    required this.onVolume,
    required this.onBackGround,
  });

  Metronome copyWith({
    int? volume,
    int? initialBeat,
    int? currentBeat,
    int? bpm,
    bool? onVibration,
    bool? onPlay,
    bool? onVolume,
    bool? onBackGround,
  }) {
    return Metronome(
      volume: volume ?? this.volume,
      initialBeat: initialBeat ?? this.initialBeat,
      currentBeat: currentBeat ?? this.currentBeat,
      bpm: bpm ?? this.bpm,
      onPlay: onPlay ?? this.onPlay,
      onVibration: onVibration ?? this.onVibration,
      onVolume: onVolume ?? this.onVolume,
      onBackGround: onBackGround ?? this.onBackGround
    );
  }
}
