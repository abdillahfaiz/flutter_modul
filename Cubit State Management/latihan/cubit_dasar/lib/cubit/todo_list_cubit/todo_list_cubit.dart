import 'package:bloc/bloc.dart';
import 'package:cubit_dasar/cubit/todo_list_cubit/todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState());

  void addNotes(String note) {
    emit(state.copyWith(notes: [...state.notes, note]));
  }

  void deleteNotes(int index) {
    emit(state.copyWith(notes: List.from(state.notes)..removeAt(index)));
  }
}
