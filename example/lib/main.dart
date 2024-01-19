import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:real_size_measure/helper/custom_position.dart';
import 'package:real_size_measure/helper/point.dart';
import 'package:real_size_measure/measure.dart';
import 'package:real_size_measure/real_size_measure.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final Measure measureWidget = Measure(
    limitOfPointsCreated: 2,
  );

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: measureWidget,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              measureWidget.addNewPoint(
                CustomPoint(
                  position: CustomPosition(
                    top: MediaQuery.of(context).size.height / 2,
                    left: MediaQuery.of(context).size.width / 2,
                    offset: Offset(MediaQuery.of(context).size.width / 2,
                        MediaQuery.of(context).size.height / 2),
                  ),
                ),
              );
            },
            child: const Icon(Icons.add),
          )),
    );
  }
}
