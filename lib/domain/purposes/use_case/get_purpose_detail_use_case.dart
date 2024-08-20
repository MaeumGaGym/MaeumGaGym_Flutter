import 'package:maeumgagym_flutter/domain/purposes/entity/purpose_entity.dart';
import 'package:maeumgagym_flutter/domain/purposes/repository/purpose_repository.dart';

class GetPurposeDetailUseCase {
  final PurposeRepository _purposeRepository;

  GetPurposeDetailUseCase({
    required PurposeRepository purposeRepository,
  }) : _purposeRepository = purposeRepository;

  Future<PurposeEntity> execute({required int purposeId}) =>
      _purposeRepository.getPurposeDetail(purposeId: purposeId);
}