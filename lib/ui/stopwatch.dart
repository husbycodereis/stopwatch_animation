import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch_flutter/provider/lap_provider.dart';
import 'package:stopwatch_flutter/ui/reset_button.dart';
import 'package:stopwatch_flutter/ui/start_stop_button.dart';
import 'package:stopwatch_flutter/ui/stopwatch_renderer.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  //late makes a variable non nullable for later use because it is going to be initialized in somewhere else
  //late DateTime _initialTime;
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;
  Duration _currentlyLapElapsed = Duration.zero;
  Duration _previouslyLapElapsed = Duration.zero;
  Duration get _elapsed => _previouslyElapsed + _currentlyElapsed;
  Duration get _lapElapsed => _previouslyLapElapsed + _currentlyLapElapsed;
  int lapCount = 0;

  late final Ticker _ticker;

  LapProvider? _lapProvider;

  bool _isRunning = false;
  @override
  void initState() {
    super.initState();
    _ticker = this.createTicker((elapsed) {
      setState(() {
        _currentlyElapsed = elapsed;
        _currentlyLapElapsed = elapsed;
      });
    });
  }

  @override
  void didChangeDependencies() {
    _lapProvider = Provider.of<LapProvider>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previouslyElapsed += _currentlyElapsed;
        _previouslyLapElapsed += _currentlyLapElapsed;
        _currentlyElapsed = Duration.zero;
        _currentlyLapElapsed = Duration.zero;
      }
    });
  }

  void _lapCounter() {
    setState(() {
      if (_isRunning) {
        lapCount++;
        _lapProvider!.setLapDuration(_currentlyLapElapsed, lapCount);
        _ticker.stop();
        _currentlyLapElapsed = Duration.zero;
        _previouslyLapElapsed = Duration.zero;
        _previouslyElapsed += _currentlyElapsed;
        _ticker.start();
      } else {
        _lapProvider!.clearLapList();
        _isRunning = false;
        _currentlyLapElapsed = Duration.zero;
        _previouslyLapElapsed = Duration.zero;
        _previouslyElapsed = Duration.zero;
        _currentlyElapsed = Duration.zero;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final radius = constraints.maxWidth / 2;
        return Stack(
          children: [
            StopwatchRenderer(
              lapElapsed: _lapElapsed,
              elapsed: _elapsed,
              radius: radius,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80,
                height: 80,
                child: ResetButton(
                    isRunning: _isRunning,
                    onPressed: () {
                      _lapCounter();
                      if (_isRunning) {}
                    }),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                    isRunning: _isRunning, onPressed: _toggleRunning),
              ),
            ),
          ],
        );
      },
    );
  }
}
