import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_size_measure/bloc/real_size_measure_bloc.dart';
import 'package:real_size_measure/helper/custom_position.dart';
import 'package:real_size_measure/helper/point.dart';
import 'package:real_size_measure/point_widget.dart';

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
    final deviceOffset = Offset(MediaQuery.of(context).size.width / 2,
        MediaQuery.of(context).size.height / 2);
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
          top: point1.position.top + 5,
          left: point1.position.left + 5,
          child: Transform(
            transform: Matrix4.rotationZ(
              calculateAngle(
                point1.position.offset!,
                point2.position.offset!,
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Container(
                  height: 5,
                  width: distanceBetweenPoints(
                      point1.position.offset!, point2.position.offset!),
                  color: color,
                ),
                Text(
                  "${convertToMilimeters(distanceBetweenPoints(point1.position.offset!, point2.position.offset!), MediaQuery.of(context).size.height, MediaQuery.of(context).size.width).toStringAsFixed(1)} mm",
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

  double calculateAngle(Offset point1, Offset point2) {
    return atan2(point2.dy - point1.dy, point2.dx - point1.dx);
  }

  double distanceBetweenPoints(Offset point1, Offset point2) {
    return sqrt(pow(point2.dy - point1.dy, 2) + pow(point2.dx - point1.dx, 2));
  }

  double convertToMilimeters(
      double distance, double deviceHeight, double deviceWidth) {
    print("distancia $distance altura $deviceHeight largura $deviceWidth");
    return distance * 45 / deviceHeight;
  }
}
