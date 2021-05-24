import 'package:flutter/material.dart';

const double secondsHandleHeight = 10.0;
const double secondsHandleWidth = 10.0;

class SecondsClockHand extends StatelessWidget {
  final double rotationZAngle;
  final double handThickness;
  final double handLength;
  final Color color;
  const SecondsClockHand({
    Key? key,
    required this.rotationZAngle,
    required this.handThickness,
    required this.handLength,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-handThickness / 2, 0.0, 0.0)
        ..rotateZ(rotationZAngle),
      child: Container(
        height: handLength,
        width: handThickness,
        color: color,
      ),
    );
  }
}

class SecondsClockHandElongate extends StatelessWidget {
  final double rotationZAngle;
  final double handThickness;
  final double handLength;
  final Color color;
  const SecondsClockHandElongate({
    Key? key,
    required this.rotationZAngle,
    required this.handThickness,
    required this.handLength,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-handThickness / 2, 0.0, 0.0)
        ..rotateZ(rotationZAngle),
      child: Container(
        height: handLength,
        width: handThickness,
        color: color,
      ),
    );
  }
}

class SecondsClockHandCircle extends StatelessWidget {
  final Color color;
  const SecondsClockHandCircle({Key? key, required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(-secondsHandleWidth / 2, -secondsHandleHeight / 2, 0.0),
      child: Container(
        width: secondsHandleWidth,
        height: secondsHandleHeight,
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 2),
            borderRadius: BorderRadius.circular(5),
            color: Colors.black),
      ),
    );
  }
}

class MinuteClockHand extends StatelessWidget {
  final double rotationZAngle;
  final double handThickness;
  final double handLength;
  final Color color;
  const MinuteClockHand({
    Key? key,
    required this.rotationZAngle,
    required this.handThickness,
    required this.handLength,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-handThickness / 2, 0.0, 0.0)
        ..rotateZ(rotationZAngle),
      child: Container(
        height: handLength,
        width: handThickness,
        color: color,
      ),
    );
  }
}

class MinuteClockHandCircle extends StatelessWidget {
  final double handThickness;
  final double handLength;
  final Color color;
  const MinuteClockHandCircle({
    Key? key,
    required this.handThickness,
    required this.handLength,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-secondsHandleWidth / 2, -secondsHandleWidth / 2, 0.0),
      child: Container(
        width: secondsHandleWidth,
        height: secondsHandleHeight,
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 2),
            borderRadius: BorderRadius.circular(5),
            color: Colors.orange),
      ),
    );
  }
}
