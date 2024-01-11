class SelfCareRoutineItemModel {
  final String title;
  bool isUsed;
  bool isShared;

  SelfCareRoutineItemModel({
    required this.title,
    this.isUsed = false,
    this.isShared = false,
  });
}
