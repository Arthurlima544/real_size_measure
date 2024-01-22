import 'package:flutter/material.dart';

/// Point class to store point data
class CustomPoint {
  final int? id;
  final Offset pointOffset;

  CustomPoint({
    this.id,
    required this.pointOffset,
  });

  CustomPoint copyWith({
    int? id,
    Offset? pointOffset,
  }) {
    return CustomPoint(
      id: id ?? this.id,
      pointOffset: pointOffset ?? this.pointOffset,
    );
  }
}
