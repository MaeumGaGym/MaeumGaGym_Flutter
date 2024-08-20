class MetronomeEntity {
  final int volume, initialBeat, currentBeat, bpm;
  final bool onVibration, onPlay, onVolume, onBackGround;

  MetronomeEntity({
    required this.volume,
    required this.initialBeat,
    required this.currentBeat,
    required this.bpm,
    required this.onVibration,
    required this.onPlay,
    required this.onVolume,
    required this.onBackGround,
  });

  MetronomeEntity copyWith({
    int? volume,
    int? initialBeat,
    int? currentBeat,
    int? bpm,
    bool? onVibration,
    bool? onPlay,
    bool? onVolume,
    bool? onBackGround,
  }) {
    return MetronomeEntity(
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