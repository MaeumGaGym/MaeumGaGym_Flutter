import 'package:maeumgagym_flutter/data/profile/data_source/remote/remote_profile_data_source.dart';
import 'package:maeumgagym_flutter/domain/profile/entity/profile_entity.dart';

import '../../../domain/profile/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final RemoteProfileDataSource _remoteProfileDataSource;

  ProfileRepositoryImpl({required RemoteProfileDataSource remoteProfileDataSource})
      : _remoteProfileDataSource = remoteProfileDataSource;

  @override
  Future<ProfileEntity> getProfile() async {
    return await _remoteProfileDataSource.getProfile();
  }
}