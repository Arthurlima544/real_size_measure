import 'package:flutter/material.dart';
import 'package:real_size_measure/helper/classes/point.dart';
import 'package:real_size_measure/helper/widgets/bloc/real_size_measure_bloc.dart';
import 'package:real_size_measure/helper/widgets/real_size_measure_widget.dart';

final realSizeMeasureBloc = RealSizeMeasureBloc();

class Measure extends StatelessWidget {
  /// Represents the size of the points.
  final Size pointSize;

  /// Represents the color of the line that connects the points.
  final Color distanceColor;

  const Measure({
    super.key,
    this.pointSize = const Size(20, 20),
    this.distanceColor = Colors.black,
  });

  /// Add a new point to the screen callback.
  addNewPoint(CustomPoint point) {
    realSizeMeasureBloc
        .add(AddNewPoint(point: CustomPoint(pointOffset: point.pointOffset)));
  }

  /// Save Session of a measure round.
  savePoints(Offset deviceSize) {
    realSizeMeasureBloc.add(SavePointSession(deviceSize));
  }

  /// Clear old session of a measure round.
  clearOldSession() {
    realSizeMeasureBloc.add(ClearOldSession());
  }

  /// Clear all points.
  clearLastPoint() {
    realSizeMeasureBloc.add(ClearLastPoint());
  }

  /// Clear all points.
  clearAllPoints() {
    realSizeMeasureBloc.add(ClearAllPoints());
  }

  /// Change the limit of points that can be created.
  changePointLimit(int limit) {
    realSizeMeasureBloc.add(ChangePointLimit(limit));
  }

  @override
  Widget build(BuildContext context) {
    return RealSizeMeasureWidget(
      pointSize: pointSize,
      distanceColor: distanceColor,
    );
  }
}
