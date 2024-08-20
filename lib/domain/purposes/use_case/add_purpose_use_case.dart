import 'package:maeumgagym_flutter/data/purpose/dto/request/add_purpsoe_request.dart';

import '../repository/purpose_repository.dart';

class AddPurposeUseCase {
  final PurposeRepository _purposeRepository;

  AddPurposeUseCase({
    required PurposeRepository purposeRepository,
  }) : _purposeRepository = purposeRepository;

  Future<void> execute({required AddEditPurposeRequest addEditPurposeRequest}) =>
      _purposeRepository.addPurpose(addEditPurposeRequest: addEditPurposeRequest);
}