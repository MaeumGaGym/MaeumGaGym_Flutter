import 'package:flutter_bloc/flutter_bloc.dart';

class RoutineDayOfWeekStateCubit extends Cubit<Map<String, bool>> {
  RoutineDayOfWeekStateCubit() : super(
      {
        "일" : false,
        "월" : false,
        "화" : false,
        "수" : false,
        "목" : false,
        "금" : false,
        "토" : false,
      }
  );

  void init(){
    emit({
      "일": false,
      "월": false,
      "화": false,
      "수": false,
      "목": false,
      "금": false,
      "토": false,
    });
  }

  void changeState(int index){
    String indexedKey = state.keys.elementAt(index);
    Map<String, bool> data = state;
    data[indexedKey] = !data[indexedKey]!;

    emit(data);
  }

  String _conversionEnglish(String key){
    switch(key){
      case "월":
        return "MONDAY";
      case "화":
        return "TUESDAY";
      case "수":
        return "WEDNESDAY";
      case "목":
        return "THURSDAY";
      case "금":
        return "FRIDAY";
      case "토":
        return "SATURDAY";
      default :
        return "SUNDAY";
    }
  }
  
  List<String> toRequest(){
    List<String> data = <String>[];

    for(int i=0; i<state.length; i++){
      if(state.values.elementAt(i)){
        data.add(_conversionEnglish(state.keys.elementAt(i))); 
      }
    }
    return data;
  }
}