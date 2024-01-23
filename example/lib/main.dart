import 'package:flutter/material.dart';
import 'package:real_size_measure/real_size_measure.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  final Measure measureWidget = const Measure(
    limitOfPointsCreated: 4,
    pointSize: Size(20, 20),
    distanceColor: Colors.blue,
  );

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: measureWidget,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                measureWidget.savePoints(
                  Offset(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height,
                  ),
                );
              },
              child: const Icon(Icons.save),
            ),
            FloatingActionButton(
              onPressed: () {
                measureWidget.addNewPoint(
                  CustomPoint(
                    pointOffset: Offset(
                      MediaQuery.of(context).size.width / 2,
                      MediaQuery.of(context).size.height / 2,
                    ),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
