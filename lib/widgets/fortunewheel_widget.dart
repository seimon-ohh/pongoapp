import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class FortuneWheelWidget extends StatefulWidget {
  final ValueChanged<String> selected;
  FortuneWheelWidget({required this.selected});
  @override
  _FortuneWheelWidgetState createState() => _FortuneWheelWidgetState();
}

class _FortuneWheelWidgetState extends State<FortuneWheelWidget> {
  late StreamController<int> controller;
  final random = Random();

  @override
  void initState() {
    super.initState();
    controller = StreamController<int>.broadcast();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<FortuneItem> fortuneItems = [
      FortuneItem(
        child: Text('Nasenbohrer-Parade',
            style: TextStyle(
                fontFamily: "MineCraft",
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      FortuneItem(
        child: Text('Team-Hüpfburg',
            style: TextStyle(
                fontFamily: "MineCraft",
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      FortuneItem(
        child: Text('Küss den Boden',
            style: TextStyle(
                fontFamily: "MineCraft",
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      FortuneItem(
        child: Text('Gesicht voller Sahne',
            style: TextStyle(
                fontFamily: "MineCraft",
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      FortuneItem(
        child: Text('Wasserschlacht',
            style: TextStyle(
                fontFamily: "MineCraft",
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      FortuneItem(
        child: Text('Blinde Kuh',
            style: TextStyle(
                fontFamily: "MineCraft",
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      FortuneItem(
        child: Text('Stille Post Extrem',
            style: TextStyle(
                fontFamily: "MineCraft",
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      FortuneItem(
        child: Text('Gangnam Style-Tanz',
            style: TextStyle(
                fontFamily: "MineCraft",
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
    ];

    return StreamBuilder<int>(
      stream: controller.stream,
      initialData: 0,
      builder: (context, snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  FortuneWheel(
                    indicators: [],
                    items: fortuneItems,
                    selected: controller.stream,
                    styleStrategy: const UniformStyleStrategy(
                      color: Color.fromRGBO(218, 102, 81, 1.0),
                      borderColor: Colors.black,
                      borderWidth: 2.0,
                    ),
                    onAnimationEnd: () {
                      widget.selected((fortuneItems.elementAt(snapshot.data!).child as Text).data!);
                    },
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Icon(Icons.arrow_drop_down, size: 32),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                final selectedIndex = random.nextInt(fortuneItems.length);
                controller.add(selectedIndex);
              },
              child: Icon(Icons.play_arrow),
            ),
          ],
        );
      },
    );
  }
}
