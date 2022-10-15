import 'package:flutter/material.dart';

abstract class FountValues {
  static double _sizeLetter(double width) => width <= 360
      ? 12
      : width <= 480
          ? 14
          : width <= 720
              ? 16
              : 18;

  static TextStyle normalText(double width) => TextStyle(
        fontSize: _sizeLetter(width),
      );

  static TextStyle subtitleText({
    required double width,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.black,
  }) =>
      TextStyle(
        fontSize: _sizeLetter(width) + 4,
        fontWeight: fontWeight,
        color: color,
      );
}
