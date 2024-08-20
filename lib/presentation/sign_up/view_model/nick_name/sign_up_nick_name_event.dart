abstract class SignUpNickNameEvent {}

class SignUpCheckNickNameEvent extends SignUpNickNameEvent{
  String nickName;

  SignUpCheckNickNameEvent({required this.nickName});
}