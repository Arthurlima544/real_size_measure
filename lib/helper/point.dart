import 'package:real_size_measure/helper/custom_position.dart';

class CustomPoint {
  final int? id;
  final CustomPosition position;
  final CustomPoint? couple;
  final double? distanceBetweenCurrentPointAndCouple;

  CustomPoint({
    this.id,
    required this.position,
    this.couple,
    this.distanceBetweenCurrentPointAndCouple,
  });

  CustomPoint copyWith({
    int? id,
    CustomPosition? position,
    CustomPoint? couple,
    double? distanceBetweenCurrentPointAndCouple,
  }) {
    return CustomPoint(
      id: id ?? this.id,
      position: position ?? this.position,
      couple: couple ?? this.couple,
      distanceBetweenCurrentPointAndCouple:
          distanceBetweenCurrentPointAndCouple ??
              this.distanceBetweenCurrentPointAndCouple,
    );
  }
}
