part of 'real_size_measure_bloc.dart';

class RealSizeMeasureState extends Equatable {
  final List<CustomPoint> points;
  final List<PointSession> session;
  final int limitOfPointsCreated;

  const RealSizeMeasureState({
    this.points = const [],
    this.session = const [],
    this.limitOfPointsCreated = 2,
  });

  RealSizeMeasureState copyWith({
    List<CustomPoint>? points,
    List<PointSession>? session,
    int? limitOfPointsCreated,
  }) {
    return RealSizeMeasureState(
      points: points ?? this.points,
      session: session ?? this.session,
      limitOfPointsCreated: limitOfPointsCreated ?? this.limitOfPointsCreated,
    );
  }

  @override
  List<Object> get props => [points, session];
}
