import '../../../core/enum/social_state_enum.dart';

abstract class MaeumAuthEvent {}

class MaeumLoginEvent extends MaeumAuthEvent {
  final SocialStateEnum socialRequest;

  MaeumLoginEvent({required this.socialRequest});
}

class MaeumSocialLogoutEvent extends MaeumAuthEvent {
  final SocialStateEnum socialRequest;

  MaeumSocialLogoutEvent({required this.socialRequest});
}