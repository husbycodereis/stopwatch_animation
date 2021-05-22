import 'dart:math';

import 'package:flutter/material.dart';

import 'package:stopwatch_flutter/ui/clock_hand.dart';
import 'package:stopwatch_flutter/ui/clock_markers.dart';

import 'elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  final Duration elapsed;
  final Duration lapElapsed;
  final double radius;

  const StopwatchRenderer({
    Key? key,
    required this.elapsed,
    required this.lapElapsed,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //! minute counter
        for (var i = 0; i < 60; i++)
          Positioned(
              left: radius,
              top: radius / 1.8,
              child: ClockMinuteCounter(minute: i, radius: radius)),
        for (var i = 5; i <= 30; i += 5)
          Positioned(
              left: radius,
              top: radius / 1.8,
              child: ClockMinuteTickMarker(
                  value: i, maxValue: 30, radius: radius)),
        Positioned(
          left: radius,
          top: radius / 1.8,
          child: MinuteClockHand(
              rotationZAngle: pi + (2 * pi / 60) * (elapsed.inSeconds / 30),
              handThickness: 2,
              handLength: radius / 4,
              color: Colors.orange),
        ),
        //!seconds counter
        for (var i = 0; i < 300; i++)
          Positioned(
              left: radius,
              top: radius,
              child: ClockSecondsTickMarker(seconds: i, radius: radius)),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
              left: radius,
              top: radius,
              child: ClockTextMarker(value: i, maxValue: 60, radius: radius)),
        //?lap clockhand
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
              rotationZAngle: pi + (2 * pi / 60000) * lapElapsed.inMilliseconds,
              handThickness: 2,
              handLength: radius,
              color: Colors.blue),
        ),
        //?total time clockhand
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
              rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
              handThickness: 2,
              handLength: radius,
              color: Colors.orange),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
