import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled7/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(super.initialState);
  int teamAPoints = 0;

  int teamBPoints = 0;


  void TeamIncrement(String team,int buttonNum){
    if(team == 'A'){
    teamAPoints += buttonNum;
    emit(CounterAIncrementState());}
    else if (team == 'B'){
      teamBPoints += buttonNum;
      emit(CounterBIncrementState());
    }
  }
}
