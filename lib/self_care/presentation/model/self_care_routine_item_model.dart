class SelfCareRoutineItemModel {
  /// 아이템 번호
  final int itemIndex;
  /// 제목
  final String title;
  /// 보관중인지 >> true = 보관중 , false = 사용중
  bool isKept;
  /// 공유중인지 >> true = 공유중 , false = 공유중x
  bool isShared;

  SelfCareRoutineItemModel({
    required this.itemIndex,
    required this.title,
    this.isKept = true,
    this.isShared = false,
  });
}
