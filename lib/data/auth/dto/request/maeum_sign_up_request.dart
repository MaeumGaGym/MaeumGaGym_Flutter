import 'package:maeumgagym_flutter/core/enum/social_state_enum.dart';

class MaeumSignUpRequest {
  final SocialStateEnum socialEnum;
  final String oAuthToken, nickName;

  const MaeumSignUpRequest({
    required this.socialEnum,
    required this.oAuthToken,
    required this.nickName,
  });
}