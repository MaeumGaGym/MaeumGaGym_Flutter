import 'package:maeumgagym_flutter/data/purpose/dto/request/add_purpsoe_request.dart';
import 'package:maeumgagym_flutter/domain/purposes/repository/purpose_repository.dart';

class EditPurposeUseCase {
  final PurposeRepository _purposeRepository;

  EditPurposeUseCase({
    required PurposeRepository purposeRepository,
  }) : _purposeRepository = purposeRepository;

  Future<void> execute({required int purposeId, required AddEditPurposeRequest addEditPurposeRequest}) =>
      _purposeRepository.editPurpose(purposeId: purposeId, addPurposeRequest: addEditPurposeRequest);
}