import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_size_measure/helper/classes/point.dart';
import 'package:real_size_measure/helper/widgets/bloc/real_size_measure_bloc.dart';

/// This widget print out a Point on Screen and allow the user to move it.
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
            .pointOffset;
        return Positioned(
          top: pointPosition.dy,
          left: pointPosition.dx,
          child: GestureDetector(
            onPanUpdate: (details) {
              BlocProvider.of<RealSizeMeasureBloc>(context).add(
                ChangePointPosition(
                  id: widget.point.id,
                  pointOffset: details.globalPosition,
                ),
              );
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
