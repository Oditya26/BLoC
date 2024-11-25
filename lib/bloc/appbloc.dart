import 'package:flutter_bloc/flutter_bloc.dart';
import 'appEvent.dart';
import 'appState.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitialState(0)) {
    on<IncrementEvent>((event, emit) {
      final currentState = state;
      if (currentState is InitialState || currentState is UpdatedState) {
        final newCounter = (currentState is InitialState ? currentState.counter : (currentState as UpdatedState).counter) + event.value;
        emit(UpdatedState(newCounter));
      }
    });

    on<DecrementEvent>((event, emit) {
      final currentState = state;
      if (currentState is InitialState || currentState is UpdatedState) {
        final newCounter = (currentState is InitialState ? currentState.counter : (currentState as UpdatedState).counter) - event.value;
        emit(UpdatedState(newCounter));
      }
    });
  }
}
