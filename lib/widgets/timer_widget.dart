import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;
class GameTimer extends StatefulWidget {
  const GameTimer({Key? key}) : super(key: key);

  @override
  State<GameTimer> createState() => _GameTimerState();
}

class _GameTimerState extends State<GameTimer> {
  int _elapsedSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
  }

   void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void dispose() {
    super.dispose();
    stopTimer();
  }

  @override
  Widget build(BuildContext context) {

    return  Transform.rotate(
      angle: -math.pi / 2,
      child: Text(
        '${_elapsedSeconds ~/ 60}:${(_elapsedSeconds % 60).toString().padLeft(2, '0')}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
