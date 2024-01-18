part of 'real_size_measure_bloc.dart';

sealed class RealSizeMeasureEvent extends Equatable {
  const RealSizeMeasureEvent();

  @override
  List<Object> get props => [];
}

class AddNewPoint extends RealSizeMeasureEvent {
  final CustomPoint point;
  const AddNewPoint({required this.point});

  @override
  List<Object> get props => [point];
}

class ChangePointPosition extends RealSizeMeasureEvent {
  final int? id;
  final CustomPosition position;
  const ChangePointPosition({required this.id, required this.position});

  @override
  List<Object> get props => [id ?? 0, position];
}
