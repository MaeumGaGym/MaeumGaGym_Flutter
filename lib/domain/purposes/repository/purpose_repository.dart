import 'package:maeumgagym_flutter/data/purpose/dto/request/add_purpsoe_request.dart';

import '../entity/purpose_entity.dart';
import '../entity/purposes_entity.dart';

abstract class PurposeRepository {
  Future<PurposesEntity> getPurposes({required int index});

  Future<PurposeEntity> getPurposeDetail({required int purposeId});

  Future<void> addPurpose({required AddEditPurposeRequest addEditPurposeRequest});

  Future<void> editPurpose({required int purposeId, required AddEditPurposeRequest addPurposeRequest});

  Future<void> delPurpose({required int purposeId});
}