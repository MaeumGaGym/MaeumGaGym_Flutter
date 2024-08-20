import '../repository/purpose_repository.dart';

class DelPurposeUseCase {
  final PurposeRepository _purposeRepository;

  DelPurposeUseCase({
    required PurposeRepository purposeRepository,
  }) : _purposeRepository = purposeRepository;

  Future<void> execute({required int purposeId}) =>
      _purposeRepository.delPurpose(purposeId: purposeId);
}