import 'package:flutter/material.dart';
import 'package:pongoapp/screens/gameboard_screen.dart';
import 'package:provider/provider.dart';

import '../providers/gamedata_provider.dart';

class BeerPongRulesPage extends StatefulWidget {
  static const routeName = "/rules-screen";

  @override
  _BeerPongRulesPageState createState() => _BeerPongRulesPageState();
}

class _BeerPongRulesPageState extends State<BeerPongRulesPage> {
  int _numberOfCups = 6;
  bool _reracksEnabled = true;
  String _selectedChallenge = "None";
  String _selectedLevel = "Normal";

  final List<String> _challenges = ["Quiz", "Get active", "Truth or Dare"];

  final List<String> _levels = ["Normal", "Extreme", "Dirty"];
  final List<int> _cups = [6, 10];

  @override
  Widget build(BuildContext context) {
    final gameDataProvider =
        Provider.of<GameDataProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Beer Pong Rules", style: TextStyle(fontSize: 16)),
          backgroundColor: Colors.black12,
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 40),
            const Text(
              "Number of cups:",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
           const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  color: Colors.white,
                  fillColor: Color.fromRGBO(188, 188, 188, 1),
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  borderColor: Colors.white,
                  selectedBorderColor: Colors.white,
                  isSelected: _cups.map((cup) => cup == _numberOfCups).toList(),
                  onPressed: (index) {
                    setState(() {
                      _numberOfCups = _cups[index];
                    });
                    gameDataProvider.updateNumberOfCups(_numberOfCups);
                  },
                  children: _cups
                      .map((cup) => Text(
                            cup.toString(),
                            style: TextStyle(fontSize: 12),
                          ))
                      .toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            ToggleButtons(
              color: Colors.white,
              fillColor: Color.fromRGBO(188, 188, 188, 1),
              selectedColor: Color.fromRGBO(0, 0, 0, 1),
              borderRadius: BorderRadius.circular(10),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("Allow reracks",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12)),
                ),
              ],
              isSelected: [_reracksEnabled],
              onPressed: (index) {
                setState(() {
                  _reracksEnabled = !_reracksEnabled;
                });
                gameDataProvider.updateAllowReracks(_reracksEnabled);
              },
            ),
            SizedBox(height: 20),
            Text(
              "Select a challenge:",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            ToggleButtons(
              color: Colors.white,
              fillColor: Color.fromRGBO(188, 188, 188, 1),
              selectedColor: Color.fromRGBO(0, 0, 0, 1),
              borderRadius: BorderRadius.circular(10),
              children: _challenges.map((challenge) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(challenge, style: TextStyle(fontSize: 12)),
                );
              }).toList(),
              isSelected: _challenges
                  .map((challenge) => challenge == _selectedChallenge)
                  .toList(),
              onPressed: (index) {
                setState(() {
                  _selectedChallenge = _challenges[index];
                });
                gameDataProvider.updateChallenges(_selectedChallenge);
              },
            ),
            SizedBox(height: 20),
            Text(
              "Select a level:",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            ToggleButtons(
              color: Colors.white,
              fillColor: Color.fromRGBO(188, 188, 188, 1),
              selectedColor: Color.fromRGBO(0, 0, 0, 1),
              borderRadius: BorderRadius.circular(10),
              children: _levels.map((level) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(level, style: TextStyle(fontSize: 12)),
                );
              }).toList(),
              isSelected:
                  _levels.map((level) => level == _selectedLevel).toList(),
              onPressed: (index) {
                setState(() {
                  _selectedLevel = _levels[index];
                });
                gameDataProvider.updateLevel(_selectedLevel);
              },
            ),
            SizedBox(height: 140),
            ElevatedButton(
              child: Text("Start game", style: TextStyle(fontSize: 14)),
              onPressed: () {
                Navigator.pushNamed(context, GameboardScreen.routeName);
              },
            ),
          ]),
        ));
  }
}
