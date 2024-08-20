import '../../../../domain/auth/entity/social_entity.dart';

class SocialDto {
  String token;

  SocialDto({required this.token});

  SocialEntity toEntity() {
    return SocialEntity(
      token: token,
    );
  }
}
