import '../../../../data/auth/dto/request/maeum_sign_up_request.dart';

class SignUpSuccessEvent {
  final MaeumSignUpRequest maeumSignUpRequest;

  const SignUpSuccessEvent({required this.maeumSignUpRequest});
}