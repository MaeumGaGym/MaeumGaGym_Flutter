class MaeumgagymSignUpModel {
  final int statusCode;

  MaeumgagymSignUpModel({required this.statusCode});

  factory MaeumgagymSignUpModel.fromJson(int statusCode) {
    return MaeumgagymSignUpModel(statusCode: statusCode);
  }
}
