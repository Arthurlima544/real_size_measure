import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:real_size_measure/helper/custom_position.dart';
import 'package:real_size_measure/helper/point.dart';

part 'real_size_measure_event.dart';
part 'real_size_measure_state.dart';

class RealSizeMeasureBloc
    extends Bloc<RealSizeMeasureEvent, RealSizeMeasureState> {
  RealSizeMeasureBloc() : super(const RealSizeMeasureState()) {
    on<AddNewPoint>((event, emit) {
      int? newPointId;
      if (state.points.length >= 8) {
        return;
      } else if (state.points.length % 2 != 0 && state.points.isNotEmpty) {
        newPointId = state.points.length + 1;
        print(" New Couple: ${state.points.last.id}º and $newPointIdº");
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
  }
}
