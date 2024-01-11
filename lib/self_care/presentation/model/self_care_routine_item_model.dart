class SelfCareRoutineItemModel {
  final String title;
  bool isKept;
  bool isShared;

  SelfCareRoutineItemModel({
    required this.title,
    this.isKept = false,
    this.isShared = false,
  });
}
