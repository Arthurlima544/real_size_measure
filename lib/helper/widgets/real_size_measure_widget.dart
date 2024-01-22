library real_size_measure;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_size_measure/helper/others/constants.dart';
import 'package:real_size_measure/helper/classes/point.dart';
import 'package:real_size_measure/helper/widgets/bloc/real_size_measure_bloc.dart';
import 'package:real_size_measure/helper/widgets/point_widget.dart';
import 'package:real_size_measure/helper/widgets/points_and_straight.dart';

/// Return a Stack with the points and lines created by the user.
class RealSizeMeasureWidget extends StatefulWidget {
  const RealSizeMeasureWidget({super.key});

  @override
  State<RealSizeMeasureWidget> createState() => _RealSizeMeasureWidgetState();
}

class _RealSizeMeasureWidgetState extends State<RealSizeMeasureWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealSizeMeasureBloc, RealSizeMeasureState>(
      builder: (context, state) {
        List<Widget> widgetsOnStack = pointsToWidgets(state.points);

        return Stack(
          children: widgetsOnStack,
        );
      },
    );
  }

  /// Convert a list of points to a list of PointWidget or PointsAndStraight.
  List<Widget> pointsToWidgets(List<CustomPoint> points) {
    List<Widget> widgets = [];
    final tamanho = points.length;

    for (int i = 0; i < tamanho; i += 2) {
      if (i + 1 < tamanho) {
        widgets.add(
          PointsAndStraight(
            point1: points[i],
            point2: points[i + 1],
            color: colors[i],
          ),
        );
      } else {
        widgets.add(PointWidget(point: points[i], color: colors[i]));
      }
    }
    return widgets;
  }
}
