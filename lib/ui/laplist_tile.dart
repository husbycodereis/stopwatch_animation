import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/model/laptime_model.dart';

class LapListTile extends StatelessWidget {
  final int index;
  final LapTime lapTime;
  const LapListTile({
    Key? key,
    required this.index,
    required this.lapTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Lap ${index + 1}',
        style: TextStyle(
            color: lapTime.isLongest
                ? Colors.red
                : lapTime.isShortest
                    ? Colors.green
                    : Colors.white),
      ),
      trailing: Text(
        lapTime.duration.toString().substring(2, 10),
        style: TextStyle(
            color: lapTime.isLongest
                ? Colors.red
                : lapTime.isShortest
                    ? Colors.green
                    : Colors.white),
      ),
    );
  }
}
