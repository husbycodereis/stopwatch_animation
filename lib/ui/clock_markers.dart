import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondsTickMarker extends StatelessWidget {
  final int seconds;
  final double radius;
  const ClockSecondsTickMarker({
    Key? key,
    required this.seconds,
    required this.radius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = seconds % 25 == 0 ? Colors.white : Colors.grey[700];
    final width = 1.8;
    final height = seconds % 5 == 0 ? 16.0 : 8.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(2 * pi * (seconds / 300))
        ..translate(0.0, radius - height / 2, 0.0),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  final int value;
  final int maxValue;
  final double radius;
  const ClockTextMarker({
    Key? key,
    required this.value,
    required this.maxValue,
    required this.radius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double fontSize = 24;
    const width = 49.0;
    const height = 30.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(pi + (pi * 2) * (value / maxValue))
        ..translate(0.0, radius - 35, 0.0)
        ..rotateZ(pi - (2 * pi) * (value / maxValue)),
      child: Container(
        width: width,
        height: height,
        child: Text(
          '$value',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
        ),
      ),
    );
  }
}

class ClockMinuteCounter extends StatelessWidget {
  final int minute;
  final double radius;
  const ClockMinuteCounter({
    Key? key,
    required this.minute,
    required this.radius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = minute % 10 == 0 ? Colors.white : Colors.grey[700];
    final width = 1.4;
    final height = minute % 2 == 0 ? 12.0 : 6.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width, -height / 2, 0.0)
        ..rotateZ(2 * pi * (minute / 60))
        ..translate(0.0, radius / 4 - height / 2, 0.0),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}

class ClockMinuteTickMarker extends StatelessWidget {
  final int value;
  final int maxValue;
  final double radius;
  const ClockMinuteTickMarker({
    Key? key,
    required this.value,
    required this.maxValue,
    required this.radius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double fontSize = 14;
    const width = 49.0;
    const height = 30.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 4, 0.0)
        ..rotateZ(pi + (pi * 2) * (value / maxValue))
        ..translate(0.0, radius / 4 - 25, 0.0)
        ..rotateZ(pi - (2 * pi) * (value / maxValue)),
      child: Container(
        width: width,
        height: height,
        child: Text(
          '$value',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
        ),
      ),
    );
  }
}
