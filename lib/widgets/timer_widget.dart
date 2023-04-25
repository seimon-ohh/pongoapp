import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class GameTimer extends StatefulWidget {


  @override
  _GameTimerState createState() => _GameTimerState();
}

class _GameTimerState extends State<GameTimer> {
  int _elapsedSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;

      });
    });
  }

  String getFormattedTime() {
    return '${_elapsedSeconds ~/ 60}:${(_elapsedSeconds % 60).toString().padLeft(2, '0')}';
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    stopTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / 2,
      child: Text(
        '${_elapsedSeconds ~/ 60}:${(_elapsedSeconds % 60).toString().padLeft(2, '0')}',
        maxLines: 1,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
