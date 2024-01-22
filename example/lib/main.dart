import 'package:flutter/material.dart';
import 'package:real_size_measure/real_size_measure.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final Measure measureWidget = Measure(
    limitOfPointsCreated: 8,
  );

  MainApp({super.key});

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
