import 'package:flutter_bloc/flutter_bloc.dart';

class PageManagerStateCubit extends Cubit<int> {
  PageManagerStateCubit() : super(0);

  void init(){
    emit(0);
  }

  void changeState(int state){
    emit(state);
  }
}