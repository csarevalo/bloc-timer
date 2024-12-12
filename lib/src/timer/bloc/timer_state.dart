part of 'timer_bloc.dart';

@immutable
sealed class TimerState extends Equatable {
  const TimerState(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}

final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial {dur: $duration}';
}

final class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerInitial {dur: $duration}';
}

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerInitial {dur: $duration}';
}

final class TimerRunCompleted extends TimerState {
  const TimerRunCompleted() : super(0);

  @override
  String toString() => 'TimerInitial {dur: $duration}';
}
