class LapTime {
  Duration duration;
  bool isShortest;
  bool isLongest;
  int index;
  LapTime({
    required this.duration,
    this.isShortest = false,
    this.isLongest = false,
    required this.index,
  });
}
