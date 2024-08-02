import 'package:hive/hive.dart';

part 'pose_data_model.g.dart';

@HiveType(typeId: 2)
class PoseDataModel {
  @HiveField(1)
  final int? id;
  @HiveField(2)
  final bool? needMachine;
  @HiveField(3)
  final String? name;
  @HiveField(4)
  final String? thumbnail;
  @HiveField(5)
  final List<String> simplePart;
  @HiveField(6)
  final List<String> exactPart;
  @HiveField(7)
  final List<String> category;

  const PoseDataModel({
    required this.id,
    required this.thumbnail,
    required this.name,
    required this.needMachine,
    required this.simplePart,
    required this.exactPart,
    required this.category
  });

  factory PoseDataModel.fromJson(Map<String, dynamic> json) {
    return PoseDataModel(
      id: json['id'],
      thumbnail: json['thumbnail'],
      name: json['name'],
      needMachine: json['need_machine'],
      simplePart: List<String>.from(json['simple_part']),
      exactPart: List<String>.from(json['exact_part']),
      category: List<String>.from(json['category']),
    );
  }
}
