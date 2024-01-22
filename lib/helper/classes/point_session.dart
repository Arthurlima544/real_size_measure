import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:real_size_measure/helper/classes/point.dart';

/// PointSession class to store point session data
class PointSession extends Equatable {
  final int id;
  final List<CustomPoint> points;
  final List<double> distancesInPixels;
  final List<double> distancesInMilimeters;
  final List<Color> coupleColors;

  const PointSession({
    required this.id,
    required this.points,
    required this.distancesInPixels,
    required this.distancesInMilimeters,
    required this.coupleColors,
  });

  @override
  List<Object?> get props =>
      [id, points, distancesInPixels, distancesInMilimeters];

  @override
  String toString() {
    return 'PointSession(id: $id, points: $points, distancesInPixels: $distancesInPixels, distancesInMilimeters: $distancesInMilimeters, coupleColors: $coupleColors)';
  }
}
