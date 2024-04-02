class RoutineStatusModel {
  final bool isArchived;
  final bool isShared;

  RoutineStatusModel({
    required this.isArchived,
    required this.isShared,
  });

  factory RoutineStatusModel.fromJson(Map<String, dynamic> json) {
    return RoutineStatusModel(
      isArchived: json['is_archived'],
      isShared: json['is_shared'],
    );
  }
}
