import 'package:maeumgagym_flutter/core/enum/social_state_enum.dart';

class MaeumAuthModel {
  final SocialStateEnum socialEnum;
  final String oAuthToken;

  const MaeumAuthModel({
    required this.socialEnum,
    required this.oAuthToken,
  });
}