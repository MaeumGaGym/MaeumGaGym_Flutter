import 'package:flutter/cupertino.dart';

class PurposeCalenderModel {
  final LayerLink calenderLayerLink = LayerLink();
  DateTime date;
  bool isActive;
  OverlayEntry? overlay;

  PurposeCalenderModel({
    required this.isActive,
    required this.overlay,
    required this.date,
  });

  PurposeCalenderModel copyWith({
    bool? isActive,
    OverlayEntry? overlay,
    DateTime? date,
  }) {
    return PurposeCalenderModel(
      isActive: isActive ?? this.isActive,
      overlay: overlay ?? this.overlay,
      date: date ?? this.date,
    );
  }
}
