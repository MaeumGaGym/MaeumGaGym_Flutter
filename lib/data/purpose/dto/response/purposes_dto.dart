import 'package:maeumgagym_flutter/data/purpose/dto/response/purpose_dto.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purpose_entity.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purposes_entity.dart';

class PurposesDto {
  final List<PurposeDto> purposes;

  const PurposesDto({required this.purposes});

  factory PurposesDto.fromJson(Map<String, dynamic> json) {
    return PurposesDto(
      purposes: json['purpose_list']
          .map<PurposeDto>((e) => PurposeDto.fromJson(e))
          .toList(),
    );
  }

  PurposesEntity toEntity() {
    return PurposesEntity(
      purposes: purposes.map<PurposeEntity>((e) => e.toEntity()).toList(),
    );
  }
}
