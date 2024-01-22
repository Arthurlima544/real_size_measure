part of 'real_size_measure_bloc.dart';

class RealSizeMeasureState extends Equatable {
  final List<CustomPoint> points;
  final List<PointSession> session;

  const RealSizeMeasureState({
    this.points = const [],
    this.session = const [],
  });

  RealSizeMeasureState copyWith({
    List<CustomPoint>? points,
    List<PointSession>? session,
  }) {
    return RealSizeMeasureState(
      points: points ?? this.points,
      session: session ?? this.session,
    );
  }

  @override
  List<Object> get props => [points, session];
}
