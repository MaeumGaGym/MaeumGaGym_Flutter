class ExerciseInfoRequest {
  final int id, repetitions, sets;

  const ExerciseInfoRequest({
    required this.id,
    required this.repetitions,
    required this.sets,
  });

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['repetitions'] = repetitions;
    data['sets'] = sets;

    return data;
  }
}
