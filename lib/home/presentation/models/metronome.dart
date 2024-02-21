class Metronome {
  final double volume;
  final int beat;
  final int bpm;
  final bool onVibration;
  final bool onPlay;

  Metronome(
      {required this.volume,
      required this.beat,
      required this.bpm,
      required this.onVibration,
      required this.onPlay});

  Metronome copyWith({
    double? volume,
    int? beat,
    int? bpm,
    bool? onVibration,
    bool? onPlay,
  }) {
    return Metronome(
      volume: volume ?? this.volume,
      beat: beat ?? this.beat,
      bpm: bpm ?? this.bpm,
      onPlay: onPlay ?? this.onPlay,
      onVibration: onVibration ?? this.onVibration,
    );
  }
}
