import 'dart:async';
import 'package:bloc_2_bloc/blocs/color/color_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';
part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final ColorBloc colorBloc;
  late final StreamSubscription colorSub;
  int incrementSize = 1;
  CounterBloc({required this.colorBloc}) : super(CounterState.initial()) {
    colorSub = colorBloc.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.blue) {
        incrementSize = 10;
      } else if (colorState.color == Colors.green) {
        incrementSize = 100;
      } else if (colorState.color == Colors.black) {
        incrementSize = -100;
        add(IncreamentEvent());
      }
    });
    on<IncreamentEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + incrementSize));
    });
  }
  @override
  Future<void> close() {
    colorSub.cancel();
    return super.close();
  }
}
