import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import '../helpers/custom_indicator.dart';

class FortuneWheelWidget extends StatefulWidget {
  final ValueChanged<String> selected;
  FortuneWheelWidget({required this.selected});
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
      FortuneItem(
          child: Text('Arschbohrer',
              style: TextStyle(fontFamily: "MineCraft", color: Colors.white))),
      FortuneItem(
          child: Text('5x Shot',
              style: TextStyle(fontFamily: "MineCraft", color: Colors.white))),
      FortuneItem(
          child: Text('Karotte in Po',
              style: TextStyle(fontFamily: "MineCraft", color: Colors.white))),
    ];
    final random = Random();
    final selected =
    fortuneItems.elementAt(random.nextInt(fortuneItems.length));
    final selectedIndex = fortuneItems.toList().indexOf(selected);
    controller.add(selectedIndex);

    return FortuneWheel(
        indicators: const <FortuneIndicator>[
          FortuneIndicator(
            alignment: Alignment.topCenter,
            child:
            CustomTriangleIndicator(height: 10, width: 60, notRotate: true),
          ),
        ],
        items: fortuneItems,
        styleStrategy: const UniformStyleStrategy(
          color: Colors.black,
          borderColor: Colors.white,
          borderWidth: 2.0,
        ),
        onAnimationEnd: () {
          // Rufen Sie den selected-Callback im Haupt-Widget auf, um die ausgewählte Person zu aktualisieren und das Popup anzuzeigen
          widget.selected(
              (fortuneItems.elementAt(selectedIndex).child as Text).data!);
        });
  }
}
