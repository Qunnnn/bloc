import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String msg;

  @override
  List<Object?> get props => [msg];

  const CustomError({
    this.msg = '',
  });
}
