import 'package:flutter_bloc/flutter_bloc.dart';

enum PoseMachineSelectorEnum { all, calisthenics, machine }

class PoseMachineSelectorEnumCubit extends Cubit<PoseMachineSelectorEnum>{
  PoseMachineSelectorEnumCubit() : super(PoseMachineSelectorEnum.all);

  void initState(){
    emit(PoseMachineSelectorEnum.all);
  }

  void changeCalisthenics(){
    if(state == PoseMachineSelectorEnum.calisthenics){
      emit(PoseMachineSelectorEnum.all);
    } else {
      emit(PoseMachineSelectorEnum.calisthenics);
    }
  }

  void changeMachine(){
    if(state == PoseMachineSelectorEnum.machine){
      emit(PoseMachineSelectorEnum.all);
    } else {
      emit(PoseMachineSelectorEnum.machine);
    }
  }
}