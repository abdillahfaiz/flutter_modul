import 'package:bloc/bloc.dart';
import 'package:cubit_dasar/cubit/todo_list_cubit/todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState());

  void addNotes(String note) {
    var noteState = state.notes;

    noteState.add(note);

    emit(
      state.copyWith(
        notes: noteState, // -> mirip dengan state.notes.add(note)
      ),
    );
  }

  void deleteNotes(int index) {
    var noteState = state.notes;

    noteState.removeAt(index);

    emit(state.copyWith(notes: noteState));
  }
}
