class PurposeBaseModel {
  final String? title;
  final String? content;
  final String? startDate;
  final String? endDate;

  PurposeBaseModel({
    required this.title,
    required this.content,
    required this.startDate,
    required this.endDate,
  });

  factory PurposeBaseModel.fromJson(
    Map<String, dynamic> json
  ) {
    return PurposeBaseModel(
      title: json['title'],
      content: json['content'],
      startDate: json['start_date'],
      endDate: json['end_date'],
    );
  }
}
