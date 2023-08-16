part of 'color_bloc.dart';

class ColorState extends Equatable {
  const ColorState({required this.color});
  final Color color;

  factory ColorState.initial() {
    return const ColorState(color: Colors.red);
  }

  @override
  List<Object> get props => [color];

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }
}
