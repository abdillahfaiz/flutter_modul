// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  const CounterState({
    this.counterValue = 0,
    this.isLoading = false,
    this.notes = const [],
  });

  final int counterValue;
  final bool isLoading;
  final List notes;

  @override
  List<Object?> get props => [counterValue, isLoading, notes];

  CounterState copyWith({
    int? counterValue,
    bool? isLoading,
    List? notes,
  }) {
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
      isLoading: isLoading ?? this.isLoading,
      notes: notes ?? this.notes,
    );
  }
}
