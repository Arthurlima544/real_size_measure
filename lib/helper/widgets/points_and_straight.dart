import 'dart:math';
import 'package:flutter/material.dart';
import 'package:real_size_measure/helper/others/methods.dart';
import 'package:real_size_measure/helper/classes/point.dart';
import 'package:real_size_measure/helper/widgets/point_widget.dart';

/// This widget is used to show the points and the straight between them.
/// Only when the user has created two points.
class PointsAndStraight extends StatelessWidget {
  final CustomPoint point1;
  final CustomPoint point2;
  final Color color;

  const PointsAndStraight({
    super.key,
    required this.point1,
    required this.point2,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PointWidget(
          point: point1,
          color: color,
        ),
        PointWidget(
          point: point2,
          color: color,
        ),
        Positioned(
          top: point1.pointOffset.dy + 5,
          left: point1.pointOffset.dx + 5,
          child: Transform(
            transform: Matrix4.rotationZ(
              calculateAngle(
                point1.pointOffset,
                point2.pointOffset,
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Container(
                  height: 5,
                  width: distanceBetweenPoints(
                      point1.pointOffset, point2.pointOffset),
                  color: color,
                ),
                Text(
                  "${convertToMilimeters(distanceBetweenPoints(point1.pointOffset, point2.pointOffset), MediaQuery.of(context).size.height, MediaQuery.of(context).size.width).toStringAsFixed(1)} mm",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
