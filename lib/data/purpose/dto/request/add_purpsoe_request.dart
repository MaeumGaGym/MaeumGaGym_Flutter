class AddEditPurposeRequest {
  final String title, content, startDate, endDate;

  const AddEditPurposeRequest({
    required this.title,
    required this.content,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['content'] = content;
    data['start_date'] = startDate;
    data['end_date'] = endDate;

    return data;
  }
}