import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/gamedata_provider.dart';
import '../screens/pricing_screen.dart';
import '../screens/results_screen.dart';

class CupGameWidget extends StatefulWidget {
  @override
  _CupGameWidgetState createState() => _CupGameWidgetState();
}

class _CupGameWidgetState extends State<CupGameWidget> {
  String winnerTeamName =
      'Team A'; // Ersetzen Sie 'Team A' durch den tatsächlichen Namen des Gewinnerteams

  int selectedCupIndex = 3;

  void _moveCupLeft(GameDataProvider temp) {
    if (selectedCupIndex < 6) {
      setState(() {
        selectedCupIndex++;
      });
    } else {
      _showWinnerDialog(temp);
    }
  }

  void _moveCupRight(GameDataProvider temp) {
    if (selectedCupIndex > 0) {
      setState(() {
        selectedCupIndex--;
      });
    } else {
      _showWinnerDialog(temp);
    }
  }

  String determineWinnerTeam() {
    if (selectedCupIndex >= 4) {
      return "Team 1";
    } else if (selectedCupIndex <= 2) {
      return "Team 2";
    } else {
      return ""; // oder einen Standardwert zurückgeben, falls keine der beiden Bedingungen erfüllt ist
    }
  }

  void _showWinnerDialog(GameDataProvider temp) {
    String winnerTeamName = determineWinnerTeam();
    String gamemode = temp.gameData.gamemode;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Gewinner!'),
          content: Text('Das Spiel ist beendet. Gewinner: $winnerTeamName'),
          actions: [
            Builder(builder: (BuildContext innerContext) {
              return TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ResultsScreen(
                        winnerTeamName: winnerTeamName,
                        gamemode: gamemode,
                      ),
                    ),
                        (Route<dynamic> route) => false,
                  );
                },
                child: Text('OK'),
              );
            }),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final gameDataProvider =
        Provider.of<GameDataProvider>(context, listen: false);

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
                  onPressed: () => _moveCupLeft(gameDataProvider),
                  icon: Icon(Icons.arrow_back),
                  color: Colors.blue,
                  iconSize: 60,
                ),
              ),
              SizedBox(width: 16),
              Column(
                children: [
                  _buildCup(0, Colors.blue),
                  _buildCup(1, Colors.lightBlue.shade900),
                  _buildCup(2, Color.fromRGBO(0, 0, 139, 1)),
                  _buildCup(3, Colors.purple),
                  _buildCup(4, Color.fromRGBO(139, 0, 0, 1)),
                  _buildCup(5, Colors.red.shade900),
                  _buildCup(6, Colors.red),
                ],
              ),
              SizedBox(width: 16),
              RotationTransition(
                turns:
                    AlwaysStoppedAnimation(selectedCupIndex < 6 ? 0.75 : -0.25),
                child: IconButton(
                  onPressed: () => _moveCupRight(gameDataProvider),
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

  Widget _buildCup(int index, Color color) {
    bool selected = index == selectedCupIndex;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: selected ? color : Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              selectedCupIndex = index;
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
