import 'package:maeumgagym_flutter/data/purpose/data_source/remote/remote_purpose_data_source.dart';
import 'package:maeumgagym_flutter/data/purpose/dto/request/add_purpsoe_request.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purpose_entity.dart';
import 'package:maeumgagym_flutter/domain/purposes/entity/purposes_entity.dart';
import 'package:maeumgagym_flutter/domain/purposes/repository/purpose_repository.dart';

class PurposeRepositoryImpl implements PurposeRepository {
  final RemotePurposeDataSource _remotePurposeDataSource;

  const PurposeRepositoryImpl({
    required RemotePurposeDataSource remotePurposeDataSource,
  }) : _remotePurposeDataSource = remotePurposeDataSource;

  @override
  Future<PurposesEntity> getPurposes({required int index}) {
    return _remotePurposeDataSource.getPurposes(index: index);
  }

  @override
  Future<PurposeEntity> getPurposeDetail({required int purposeId}) {
    return _remotePurposeDataSource.getPurposeDetail(purposeId: purposeId);
  }

  @override
  Future<void> addPurpose({required AddEditPurposeRequest addEditPurposeRequest}) {
    return _remotePurposeDataSource.addPurpose(addEditPurposeRequest: addEditPurposeRequest);
  }

  @override
  Future<void> editPurpose({required int purposeId, required AddEditPurposeRequest addPurposeRequest}) {
    return _remotePurposeDataSource.editPurpose(purposeId: purposeId, addPurposeRequest: addPurposeRequest);
  }

  @override
  Future<void> delPurpose({required int purposeId}) {
    return _remotePurposeDataSource.delPurpose(purposeId: purposeId);
  }
}
