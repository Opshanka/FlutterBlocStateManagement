part of 'counter_bloc.dart';

abstract class CounterState {
  const CounterState();

  @override
  List<Object> get props => [];
}

@immutable
class CounterInitial extends CounterState {}

class IncrementState extends CounterState {
  int value;
  IncrementState({required this.value});
}

class DecrementState extends CounterState {
  int value;
  DecrementState({required this.value});
}
