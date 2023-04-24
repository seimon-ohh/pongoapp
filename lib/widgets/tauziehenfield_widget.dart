import 'package:flutter/material.dart';

class CupGameWidget extends StatefulWidget {
  @override
  _CupGameWidgetState createState() => _CupGameWidgetState();
}

class _CupGameWidgetState extends State<CupGameWidget> {
  int selectedCupIndex = 3;

  void _moveCupLeft() {
    if (selectedCupIndex < 6) {
      setState(() {
        selectedCupIndex++;
      });
    } else {
      _showWinnerDialog();
    }
  }

  void _moveCupRight() {
    if (selectedCupIndex > 0) {
      setState(() {
        selectedCupIndex--;
      });
    } else {
      _showWinnerDialog();
    }
  }

  void _showWinnerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Gewinner!'),
          content: Text('Das Spiel ist beendet.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: AlwaysStoppedAnimation(-0.25),
                child: IconButton(
                  onPressed: _moveCupLeft,
                  icon: Icon(Icons.arrow_back),
                  color: Colors.blue,
                  iconSize: 60,
                ),
              ),
              SizedBox(width: 16),
              Column(
                children: [
                  for (int i = 0; i < 7; i++) _buildCup(i == selectedCupIndex),
                ],
              ),
              SizedBox(width: 16),
              RotationTransition(
                turns: AlwaysStoppedAnimation(selectedCupIndex < 6 ? 0.75 : -0.25),
                child: IconButton(
                  onPressed: _moveCupRight,
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.red,
                  iconSize: 60,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildCup(bool selected) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: selected ? Colors.purple : Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              selectedCupIndex = selectedCupIndex;
            });
          },
          child: Text(''),
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shape: CircleBorder(),
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
