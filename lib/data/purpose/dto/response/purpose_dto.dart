import 'package:maeumgagym_flutter/domain/purposes/entity/purpose_entity.dart';

class PurposeDto {
  final int id;
  final String title, content, startDate, endDate;

  const PurposeDto({
    required this.id,
    required this.title,
    required this.content,
    required this.startDate,
    required this.endDate,
  });

  factory PurposeDto.fromJson(Map<String, dynamic> json){
    return PurposeDto(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      startDate: json['start_date'],
      endDate: json['end_date'],
    );
  }

  PurposeEntity toEntity(){
    return PurposeEntity(
      id: id,
      title: title,
      content: content,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
