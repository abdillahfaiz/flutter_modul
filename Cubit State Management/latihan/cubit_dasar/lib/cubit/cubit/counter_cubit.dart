import 'package:bloc/bloc.dart';
import 'package:cubit_dasar/cubit/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState());

  void increment() {
    emit(state.copyWith(
      counterValue: state.counterValue + 1,
      isLoading: !state.isLoading
    ));
  }

  void addNotes(String note){
    emit(state.copyWith(
      notes: [...state.notes, note],
      isLoading: !state.isLoading
    ));
  }

}
