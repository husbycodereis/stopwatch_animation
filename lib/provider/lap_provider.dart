import 'package:flutter/material.dart';

import 'package:stopwatch_flutter/model/laptime_model.dart';

class LapProvider extends ChangeNotifier {
  List<LapTime> lapList = [];

  void setLapDuration(Duration duration, int lapCount) {
    lapList.add(LapTime(duration: duration, index: lapCount));
    if (lapList.length > 1) {
      List<LapTime> lapListCopy = lapList;
      calculateLongest(lapListCopy);
      calculateShortest(lapListCopy);
      lapList.sort((a, b) => a.index.compareTo(b.index));
    }
    notifyListeners();
  }

  void clearLapList() {
    lapList.clear();
    notifyListeners();
  }

  void calculateLongest(List<LapTime> lapListCopy) {
    lapListCopy.sort((a, b) => a.duration.compareTo(b.duration));
    //print(lapListCopy.last.duration);
    lapList.forEach((element) => element.isLongest = false);
    lapList
        .firstWhere((element) => element.duration == lapListCopy.last.duration)
        .isLongest = true;
  }

  void calculateShortest(List<LapTime> lapListCopy) {
    lapListCopy.sort((a, b) => a.duration.compareTo(b.duration));
    //print(lapListCopy.first.duration);
    lapList.forEach((element) => element.isShortest = false);
    lapList
        .firstWhere((element) => element.duration == lapListCopy.first.duration)
        .isShortest = true;
  }
}
