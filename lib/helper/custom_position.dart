import 'dart:ui';

import 'package:equatable/equatable.dart';

class CustomPosition extends Equatable {
  final double top;
  final double left;
  final Offset? offset;

  const CustomPosition({
    required this.top,
    required this.left,
    this.offset,
  });

  distanceTo(CustomPosition position) {
    return (position.top - top) + (position.left - left);
  }

  @override
  List<Object?> get props => [top, left];
}
