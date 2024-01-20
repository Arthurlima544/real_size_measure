import 'package:flutter/material.dart';
import 'package:real_size_measure/bloc/real_size_measure_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_size_measure/helper/point.dart';
import 'package:real_size_measure/real_size_measure.dart';

class Measure extends StatelessWidget {
  final int limitOfPointsCreated;
  late RealSizeMeasureBloc bloc;

  Measure({super.key, required this.limitOfPointsCreated}) {
    bloc = RealSizeMeasureBloc(limitOfPointsCreated: limitOfPointsCreated);
  }

  addNewPoint(CustomPoint point) {
    bloc.add(AddNewPoint(point: CustomPoint(position: point.position)));
  }

  savePoints(Offset deviceMediumPoint) {
    bloc.add(SavePointSession(deviceMediumPoint));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: const RealSizeMeasureWidget(),
    );
  }
}
