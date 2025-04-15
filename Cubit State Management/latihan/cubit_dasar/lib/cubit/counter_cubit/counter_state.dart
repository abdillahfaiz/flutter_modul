// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  const CounterState({
    this.counterValue = 0
  });

  final int counterValue;

  @override
  List<Object> get props => [counterValue];

  CounterState copyWith({
    int? counterValue,
  }) {
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
    );
  }
}
