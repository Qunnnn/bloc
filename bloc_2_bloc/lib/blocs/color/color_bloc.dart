import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_state.dart';
part 'color_event.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState.initial()) {
    on<ChangeColorEvent>((event, emit) {
      if (state.color == Colors.red) {
        emit(state.copyWith(color: Colors.blue));
      } else if (state.color == Colors.blue) {
        emit(state.copyWith(color: Colors.green));
      } else if (state.color == Colors.green) {
        emit(state.copyWith(color: Colors.black));
      } else if (state.color == Colors.black) {
        emit(state.copyWith(color: Colors.red));
      }
    });
  }
}
