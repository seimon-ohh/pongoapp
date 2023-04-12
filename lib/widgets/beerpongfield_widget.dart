import 'package:flutter/material.dart';

class BeerPongField extends StatelessWidget {
  final int cups;

  BeerPongField({required this.cups});

  int get pyramidSize {
    if (cups == 6) {
      return 3;
    } else if (cups == 10) {
      return 4;
    } else {
      throw ArgumentError('Cups must be 6 or 10.');
    }
  }

  List<Widget> _buildPyramid() {
    List<Widget> pyramid = [];
    for (int row = 0; row < pyramidSize; row++) {
      List<Widget> rowContent = [];
      for (int col = 0; col < pyramidSize - row; col++) {
        rowContent.add(
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(''),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: CircleBorder(),
                padding: EdgeInsets.all(16.0),
              ),
            ),
          ),
        );
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: _buildPyramid()),
          Transform.rotate(
            angle: 3.14159265359,
            child: Column(children: _buildPyramid()),
          ),
        ],
      ),
    );
  }
}