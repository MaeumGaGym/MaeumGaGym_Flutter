import '../entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getProfile();
}