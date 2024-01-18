library real_size_measure;

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_size_measure/bloc/real_size_measure_bloc.dart';
import 'package:real_size_measure/helper/custom_position.dart';
import 'package:real_size_measure/helper/point.dart';
import 'package:real_size_measure/point_widget.dart';
import 'package:real_size_measure/points_and_straight.dart';

class RealSizeMeasureWidget extends StatefulWidget {
  const RealSizeMeasureWidget({super.key});

  @override
  State<RealSizeMeasureWidget> createState() => _RealSizeMeasureWidgetState();
}

class _RealSizeMeasureWidgetState extends State<RealSizeMeasureWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealSizeMeasureBloc, RealSizeMeasureState>(
/*       buildWhen: (previous, current) =>
          previous.points.length != current.points.length, */
      builder: (context, state) {
        List<Widget> widgetsOnStack = pointsToWidgets(state.points);

        return Stack(
          children: widgetsOnStack,
        );
      },
    );
  }

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

final colors = <Color>[
  Colors.red,
  Colors.orange,
  Colors.purple,
  Colors.yellow,
  Colors.green,
  Colors.pink,
  Colors.blue,
  Colors.teal,
];
