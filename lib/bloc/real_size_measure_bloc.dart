import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:real_size_measure/helper/custom_position.dart';
import 'package:real_size_measure/helper/point.dart';
import 'package:real_size_measure/helper/point_session.dart';
import 'package:real_size_measure/points_and_straight.dart';

part 'real_size_measure_event.dart';
part 'real_size_measure_state.dart';

class RealSizeMeasureBloc
    extends Bloc<RealSizeMeasureEvent, RealSizeMeasureState> {
  final int limitOfPointsCreated;
  RealSizeMeasureBloc({required this.limitOfPointsCreated})
      : super(const RealSizeMeasureState()) {
    on<AddNewPoint>((event, emit) {
      int? newPointId;

      if (state.points.length >= limitOfPointsCreated) {
        return;
      } else if (state.points.length % 2 != 0 && state.points.isNotEmpty) {
        newPointId = state.points.length + 1;

        emit(state.copyWith(points: [
          ...state.points,
          event.point.copyWith(
            couple: state.points.last,
            id: newPointId,
            distanceBetweenCurrentPointAndCouple:
                event.point.position.distanceTo(state.points.last.position),
          ),
        ]));
      } else {
        emit(state.copyWith(points: [
          ...state.points,
          event.point.copyWith(
            id: state.points.length + 1,
          ),
        ]));
      }
    });
    on<ChangePointPosition>(
      (event, emit) {
        emit(
          state.copyWith(
            points: [
              for (final point in state.points)
                if (point.id == event.id)
                  point.copyWith(
                    position: event.position,
                    distanceBetweenCurrentPointAndCouple: point.couple != null
                        ? point.position.distanceTo(point.couple!.position)
                        : null,
                  )
                else
                  point,
            ],
          ),
        );
      },
    );
    on<SavePointSession>((event, emit) {
      final points = state.points;
      final pointsPosition = points.map((e) => e.position).toList();
      List<double> listDistancesInPixels = [];
      List<double> listDistancesInMilimeters = [];
      List<Color> coupleColors = [];

      for (int i = 0; i < pointsPosition.length; i += 2) {
        final distance = distanceBetweenPoints(
            pointsPosition[i].offset!, pointsPosition[i + 1].offset!);
        listDistancesInPixels.add(distance);
        listDistancesInMilimeters.add(convertToMilimeters(
            distance, event.deviceMediumPoint.dy, event.deviceMediumPoint.dx));
        coupleColors.add(colors[i]);
      }
      emit(
        state.copyWith(
          session: [
            ...state.session,
            PointSession(
              id: state.session.isEmpty ? 1 : state.session.last.id + 1,
              points: state.points,
              distancesInMilimeters: listDistancesInMilimeters,
              distancesInPixels: listDistancesInPixels,
              coupleColors: coupleColors,
            ),
          ],
        ),
      );
    });
    on<ClearOldSession>((event, emit) {
      emit(state.copyWith(session: [], points: []));
    });
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
