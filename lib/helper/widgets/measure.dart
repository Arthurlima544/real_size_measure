import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_size_measure/helper/classes/point.dart';
import 'package:real_size_measure/helper/widgets/bloc/real_size_measure_bloc.dart';
import 'package:real_size_measure/helper/widgets/real_size_measure_widget.dart';

class Measure extends StatelessWidget {
  final int limitOfPointsCreated;
  late RealSizeMeasureBloc bloc;

  Measure({super.key, required this.limitOfPointsCreated}) {
    bloc = RealSizeMeasureBloc(limitOfPointsCreated: limitOfPointsCreated);
  }

  /// Add a new point to the screen callback.
  addNewPoint(CustomPoint point) {
    bloc.add(AddNewPoint(point: CustomPoint(pointOffset: point.pointOffset)));
  }

  /// Save Session of a measure round.
  savePoints(Offset deviceSize) {
    bloc.add(SavePointSession(deviceSize));
  }

  /// Clear old session of a measure round.
  clearOldSession() {
    bloc.add(ClearOldSession());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: const RealSizeMeasureWidget(),
    );
  }
}
