import 'package:flutter_bloc/flutter_bloc.dart';

class PoseSearchStateCubit extends Cubit<String> {
  PoseSearchStateCubit() : super("");

  void initState(){
    emit("");
  }

  void changeState(String state){
    emit(state);
  }
}