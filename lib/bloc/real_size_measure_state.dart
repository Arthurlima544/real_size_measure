part of 'real_size_measure_bloc.dart';

class RealSizeMeasureState extends Equatable {
  final List<CustomPoint> points;
  const RealSizeMeasureState({
    this.points = const [],
  });

  RealSizeMeasureState copyWith({
    List<CustomPoint>? points,
  }) {
    return RealSizeMeasureState(
      points: points ?? this.points,
    );
  }

  @override
  List<Object> get props => [points];
}
