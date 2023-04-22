import 'dart:math';

import 'package:flutter/material.dart';

class BeerPongField extends StatefulWidget {
  final int cups;

  BeerPongField({required this.cups});

  @override
  _BeerPongFieldState createState() => _BeerPongFieldState();
}

class _BeerPongFieldState extends State<BeerPongField> {
  int get pyramidSize {
    if (widget.cups == 6) {
      return 3;
    } else if (widget.cups == 10) {
      return 4;
    } else {
      throw ArgumentError('Cups must be 6 or 10.');
    }
  }

  final List<String> words = [
    "Situps",
    "Liegestütz",
    "Plank",
    "Squats",
    "Handstand",
    "Salto"
  ];
  final Random random = Random();

  void _onButtonPress(ValueNotifier<Color> colorNotifier) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Challenge'),
          content: Text(words[random.nextInt(words.length)]),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    colorNotifier.value = Colors.black;
  }

  Widget _buildCup() {
    ValueNotifier<Color> colorNotifier = ValueNotifier<Color>(Colors.red);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ValueListenableBuilder<Color>(
        valueListenable: colorNotifier,
        builder: (context, color, _) {
          return ElevatedButton(
            onPressed: () => _onButtonPress(colorNotifier),
            child: Text(''),
            style: ElevatedButton.styleFrom(
              primary: color,
              shape: CircleBorder(),
              padding: EdgeInsets.all(16.0),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildPyramid() {
    List<Widget> pyramid = [];
    for (int row = 0; row < pyramidSize; row++) {
      List<Widget> rowContent = [];
      for (int col = 0; col < pyramidSize - row; col++) {
        rowContent.add(_buildCup());
      }
      pyramid.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0 * row),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: rowContent,
          ),
        ),
      );
    }
    return pyramid;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: _buildPyramid());
  }
}
