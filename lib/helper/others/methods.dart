import 'dart:math';
import 'package:flutter/material.dart';

//* Common Methods used in app

/// Calculate angle between two points
double calculateAngle(Offset point1, Offset point2) {
  return atan2(point2.dy - point1.dy, point2.dx - point1.dx);
}

/// Calculate distance between two points
double distanceBetweenPoints(Offset point1, Offset point2) {
  return sqrt(pow(point2.dy - point1.dy, 2) + pow(point2.dx - point1.dx, 2));
}

/// Convert distance in pixels to milimeters
double convertToMilimeters(
    double distance, double deviceHeight, double deviceWidth) {
  return distance * 45 / deviceHeight;
}
