import 'dart:async';
import 'package:cubit_2_cubit/cubits/color/color_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final ColorCubit colorCubit;
  int incrementSize = 1;
  late final StreamSubscription colorSub;
  CounterCubit({required this.colorCubit}) : super(CounterState.initial()) {
    colorSub = colorCubit.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.blue) {
        incrementSize = 10;
      } else if (colorState.color == Colors.green) {
        incrementSize = 100;
      } else if (colorState.color == Colors.black) {
        emit(state.copyWith(counter: state.counter + 100));
        incrementSize = -100;
      }
    });
  }
    void increamentCounter() {
      emit(state.copyWith(counter: state.counter + incrementSize));
    }
  @override
  Future<void> close() {
    colorCubit.close();
    return super.close();
  }
}
