class RoutinePoseModel {
  final int? id;
  final bool? needMachine;
  final String? name;
  List<String> simplePart = [];
  List<String> exactPart = [];
  final String? thumbnail;

  RoutinePoseModel({
    required this.id,
    required this.needMachine,
    required this.name,
    required this.simplePart,
    required this.exactPart,
    required this.thumbnail,
  });

  factory RoutinePoseModel.fromJson(Map<String, dynamic> json) {
    return RoutinePoseModel(
      id: json['id'],
      needMachine: json['need_machine'],
      name: json['name'],
      simplePart: List<String>.from(json['simple_part']),
      exactPart: List<String>.from(json['exact_part']),
      thumbnail: json['thumbnail'],
    );
  }
}
