import 'package:hive/hive.dart';
import 'package:maeumgagym_flutter/core/pose_model/pose_entity.dart';

part 'pose_dto.g.dart';

@HiveType(typeId: 1)
class PoseDto {
  @HiveField(1)
  final int id;
  @HiveField(2)
  final bool needMachine;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String thumbnail;
  @HiveField(5)
  final List<String> simplePart;
  @HiveField(6)
  final List<String> exactPart;
  @HiveField(7)
  final List<String> category;

  const PoseDto({
    required this.id,
    required this.thumbnail,
    required this.name,
    required this.needMachine,
    required this.simplePart,
    required this.exactPart,
    required this.category
  });

  factory PoseDto.fromJson(Map<String, dynamic> json) {
    return PoseDto(
      id: json['id'],
      thumbnail: json['thumbnail'],
      name: json['name'],
      needMachine: json['need_machine'],
      simplePart: List<String>.from(json['simple_part']),
      exactPart: List<String>.from(json['exact_part']),
      category: List<String>.from(json['category']),
    );
  }

  PoseEntity toEntity(){
    return PoseEntity(
      id: id,
      thumbnail: thumbnail,
      name: name,
      needMachine: needMachine,
      simplePart: simplePart,
      exactPart: exactPart,
      category: category,
    );
  }
}