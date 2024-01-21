import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_size_measure/bloc/real_size_measure_bloc.dart';
import 'package:real_size_measure/helper/custom_position.dart';
import 'package:real_size_measure/helper/point.dart';

class PointWidget extends StatefulWidget {
  final CustomPoint point;
  final Color color;
  const PointWidget({
    required this.point,
    super.key,
    required this.color,
  });

  @override
  State<PointWidget> createState() => _PointWidgetState();
}

class _PointWidgetState extends State<PointWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealSizeMeasureBloc, RealSizeMeasureState>(
      builder: (context, state) {
        final pointPosition = state.points
            .firstWhere((element) => element.id == widget.point.id)
            .position;
        return Positioned(
          top: pointPosition.top,
          left: pointPosition.left,
          child: GestureDetector(
            onPanUpdate: (details) {
              BlocProvider.of<RealSizeMeasureBloc>(context)
                  .add(ChangePointPosition(
                id: widget.point.id,
                position: CustomPosition(
                  top: details.globalPosition.dy,
                  left: details.globalPosition.dx,
                  offset: Offset(
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                  ),
                ),
              ));
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color,
              ),
            ),
          ),
        );
      },
    );
  }
}
