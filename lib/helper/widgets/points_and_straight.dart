import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_size_measure/helper/others/methods.dart';
import 'package:real_size_measure/helper/classes/point.dart';
import 'package:real_size_measure/helper/widgets/bloc/real_size_measure_bloc.dart';
import 'package:real_size_measure/helper/widgets/point_widget.dart';

/// This widget is used to show the points and the straight between them.
/// Only when the user has created two points.
class PointsAndStraight extends StatefulWidget {
  final CustomPoint point1;
  final CustomPoint point2;
  final Color color;
  final Size pointSize;
  final Color distanceColor;

  const PointsAndStraight({
    super.key,
    required this.point1,
    required this.point2,
    required this.color,
    required this.pointSize,
    required this.distanceColor,
  });

  @override
  State<PointsAndStraight> createState() => _PointsAndStraightState();
}

class _PointsAndStraightState extends State<PointsAndStraight> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealSizeMeasureBloc, RealSizeMeasureState>(
      builder: (context, state) {
        final angle = calculateAngle(
          widget.point1.pointOffset,
          widget.point2.pointOffset,
        );
        final topAditional = angle.isNegative && angle < 0 ? -10 : 0;
        final leftAdtional = angle.isNegative && angle < 0 ? 10 : 0;
        return Stack(
          children: [
            PointWidget(
              point: widget.point1,
              color: widget.color,
              pointSize: widget.pointSize,
            ),
            PointWidget(
              point: widget.point2,
              color: widget.color,
              pointSize: widget.pointSize,
            ),
            Positioned(
              top: widget.point1.pointOffset.dy +
                  widget.pointSize.height / 2 +
                  5,
              left:
                  widget.point1.pointOffset.dx + widget.pointSize.width / 2 + 5,
              child: Transform(
                transform: Matrix4.rotationZ(angle),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Container(
                      height: 5,
                      width: distanceBetweenPoints(
                          widget.point1.pointOffset, widget.point2.pointOffset),
                      color: widget.color,
                    ),
                    Text(
                      "${convertToMilimeters(distanceBetweenPoints(widget.point1.pointOffset, widget.point2.pointOffset), MediaQuery.of(context).size.height, MediaQuery.of(context).size.width).toStringAsFixed(1)} mm",
                      style: TextStyle(
                        color: widget.distanceColor,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
