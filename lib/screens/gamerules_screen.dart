import 'package:flutter/material.dart';
import 'package:pongoapp/screens/gameboard_screen.dart';
import 'package:pongoapp/screens/pricing_screen.dart';
import 'package:pongoapp/screens/tauziehen_screen.dart';
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
  String _selectedChallenge = "Quiz";
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      selectedColor: Colors.black,
                      borderRadius: BorderRadius.zero,
                      borderColor: Colors.white,
                      selectedBorderColor: Colors.white,
                      isSelected:
                          _cups.map((cup) => cup == _numberOfCups).toList(),
                      onPressed: (index) {
                        setState(() {
                          _numberOfCups = _cups[index];
                        });
                        gameDataProvider.updateNumberOfCups(_numberOfCups);
                      },
                      children: _cups
                          .map((cup) => Text(
                                cup.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Minecraft",
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                const Text(
                  "Nachwurf:",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                ToggleButtons(
                  color: Colors.white,
                  fillColor: Color.fromRGBO(188, 188, 188, 1),
                  selectedColor: Colors.black,
                  borderRadius: BorderRadius.zero,
                  borderColor: Colors.white,
                  selectedBorderColor: Colors.white,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Allow rerack",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Minecraft",
                        ),
                      ),
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
                  selectedColor: Colors.black,
                  borderRadius: BorderRadius.zero,
                  borderColor: Colors.white,
                  selectedBorderColor: Colors.white,
                  children: _challenges.map((challenge) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        challenge,
                        style: TextStyle(fontSize: 12, fontFamily: "Minecraft"),
                      ),
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
                  selectedColor: Colors.black,
                  borderRadius: BorderRadius.zero,
                  borderColor: Colors.white,
                  selectedBorderColor: Colors.white,
                  children: _levels.map((level) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        level,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Minecraft",
                          color: (level == "Dirty" || level == "Extreme") ? Colors.grey : null,
                        ),
                      ),
                    );
                  }).toList(),
                  isSelected: _levels.map((level) => level == _selectedLevel).toList(),
                  onPressed: (index) {
                    if (_levels[index] == "Dirty" || _levels[index] == "Extreme") {
                      Navigator.pushNamed(context, PricingScreen.routeName);
                    } else {
                      setState(() {
                        _selectedLevel = _levels[index];
                      });
                      gameDataProvider.updateLevel(_selectedLevel);
                    }
                  },
                ),

                SizedBox(height: 140),
                ElevatedButton(
                  child: Text("Start game", style: TextStyle(fontSize: 14)),
                  onPressed: () {
                    Navigator.pushNamed(context, GameboardScreen.routeName);
                  },
                ),
              ],
            ),
            Positioned(
              right: 95,
              top: 330,
              child: Image.asset(
                "assets/images/diamond.png",
                height: 30,
              ),
            ),Positioned(
              right: 143,
              top: 330,
              child: Image.asset(
                "assets/images/diamond.png",
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
