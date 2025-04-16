// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TodoListState extends Equatable {
  const TodoListState({
    this.notes = const ["Mengerjakan PR", "Tugas Pak Dedi", "Ngopi"],
  });

  final List<String> notes;

  @override
  List<Object> get props => [notes];

  TodoListState copyWith({List<String>? notes}) {
    return TodoListState(notes: notes ?? this.notes);
  }
}
