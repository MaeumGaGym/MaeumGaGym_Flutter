class ExerciseInfoRequestModel {
  final int? id;
  final int? repetitions;
  final int? sets;

  ExerciseInfoRequestModel({
    required this.id,
    required this.repetitions,
    required this.sets,
  });

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "repetitions" : repetitions,
      "sets" : sets,
    };
  }
}