import 'package:maeumgagym_flutter/domain/purposes/entity/purposes_entity.dart';
import 'package:maeumgagym_flutter/domain/purposes/repository/purpose_repository.dart';

class GetPurposesUseCase {
  final PurposeRepository _purposeRepository;

  GetPurposesUseCase({
    required PurposeRepository purposeRepository,
  }) : _purposeRepository = purposeRepository;

  Future<PurposesEntity> execute({required int index}) =>
      _purposeRepository.getPurposes(index: index);
}