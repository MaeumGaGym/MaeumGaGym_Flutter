import 'package:maeumgagym_flutter/domain/profile/entity/profile_entity.dart';
import 'package:maeumgagym_flutter/domain/profile/repository/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository _profileRepository;

  GetProfileUseCase({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository;

  Future<ProfileEntity> execute() => _profileRepository.getProfile();
}