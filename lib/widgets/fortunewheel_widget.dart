import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import '../helpers/custom_indicator.dart';

class FortuneWheelWidget extends StatefulWidget {


  @override
  _FortuneWheelWidgetState createState() => _FortuneWheelWidgetState();
}

class _FortuneWheelWidgetState extends State<FortuneWheelWidget> {
  StreamController<int> controller = StreamController<int>();

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<FortuneItem> fortuneItems = [
      FortuneItem(child: Text('Arschbohrer', style: TextStyle(fontFamily: "MineCraft",color: Colors.white))),
      FortuneItem(child: Text('5x Shot', style: TextStyle(fontFamily: "MineCraft",color: Colors.white))),
      FortuneItem(child: Text('Karotte in Po', style: TextStyle(fontFamily: "MineCraft",color: Colors.white))),
    ];

    return FortuneWheel(
      indicators: const <FortuneIndicator>[
        FortuneIndicator(
          alignment: Alignment.topCenter,
          child: CustomTriangleIndicator(height: 10, width: 60, notRotate: true),
        ),
      ],
      items: fortuneItems,
      styleStrategy: const UniformStyleStrategy(
        color: Colors.black,
        borderColor: Colors.white,
        borderWidth: 2.0,
      ),

    );
  }
}
