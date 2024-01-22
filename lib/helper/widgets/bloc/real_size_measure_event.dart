part of 'real_size_measure_bloc.dart';

sealed class RealSizeMeasureEvent extends Equatable {
  const RealSizeMeasureEvent();

  @override
  List<Object> get props => [];
}

/// This event is used to add a new point to the list of points.
class AddNewPoint extends RealSizeMeasureEvent {
  final CustomPoint point;
  const AddNewPoint({required this.point});

  @override
  List<Object> get props => [point];
}

/// This event is used to change the position of a point.
class ChangePointPosition extends RealSizeMeasureEvent {
  final int? id;
  final Offset pointOffset;
  const ChangePointPosition({required this.id, required this.pointOffset});

  @override
  List<Object> get props => [id ?? 0, pointOffset];
}

/// This event is used to save the session of points.
class SavePointSession extends RealSizeMeasureEvent {
  final Offset deviceMediumPoint;
  const SavePointSession(this.deviceMediumPoint);
}

/// This event is used to clear the session of points.
class ClearOldSession extends RealSizeMeasureEvent {}
