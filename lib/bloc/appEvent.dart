abstract class AppEvent {}

class IncrementEvent extends AppEvent {
  final int value;
  IncrementEvent(this.value);
}

class DecrementEvent extends AppEvent {
  final int value;
  DecrementEvent(this.value);
}
