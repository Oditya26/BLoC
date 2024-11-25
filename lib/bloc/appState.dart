abstract class AppState {}

class InitialState extends AppState {
  final int counter;
  InitialState(this.counter);
}

class UpdatedState extends AppState {
  final int counter;
  UpdatedState(this.counter);
}
