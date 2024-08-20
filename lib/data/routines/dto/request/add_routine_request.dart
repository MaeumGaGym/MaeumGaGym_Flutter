import 'exercise_info_request.dart';

class AddEditRoutineRequest {
  final String routineName;
  final bool isArchived, isShared;
  final List<ExerciseInfoRequest> exerciseInfoRequestList;
  final List<String> dayOfWeeks;

  const AddEditRoutineRequest({
    required this.routineName,
    required this.isShared,
    required this.isArchived,
    required this.exerciseInfoRequestList,
    required this.dayOfWeeks,
  });

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = <String, dynamic>{};

    data['routine_name'] = routineName;
    data['is_archived'] = isArchived;
    data['is_shared'] = isShared;
    data['exercise_info_request_list'] = exerciseInfoRequestList
        .map<Map<String, dynamic>>((e) => e.toJson())
        .toList();
    data['day_of_weeks'] = dayOfWeeks;

    return data;
  }
}