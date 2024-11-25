import 'package:flutter_bloc/flutter_bloc.dart';
import 'appEvent.dart';
import 'appState.dart';

class Appbloc extends Bloc<Appevent, Appstate> {
  int nilai = 0;

  Appbloc() : super(InitialState()) {
    on<NumberIncrementEvent>(numberIncrementMethod);
    on<NumberDecrementEvent>(numberDecrementMethod); // Handler untuk decrement
  }

  void numberIncrementMethod(NumberIncrementEvent event, Emitter<Appstate> emit) {
    nilai = nilai + 1;
    emit(UpdateState(nilai));
  }

  void numberDecrementMethod(NumberDecrementEvent event, Emitter<Appstate> emit) {
    nilai = nilai - 1;
    emit(UpdateState(nilai));
  }
}
