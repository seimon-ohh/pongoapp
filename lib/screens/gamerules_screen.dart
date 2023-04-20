import 'package:flutter/material.dart';
import 'package:pongoapp/screens/gameboard_screen.dart';

class BeerPongRulesPage extends StatefulWidget {
  static const routeName = "/rules-screen";

  @override
  _BeerPongRulesPageState createState() => _BeerPongRulesPageState();
}

class _BeerPongRulesPageState extends State<BeerPongRulesPage> {
  String _numberOfCups = "6";
  bool _reracksEnabled = true;
  String _selectedChallenge = "None";
  String _selectedLevel = "Normal";

  final List<String> _challenges = ["Quiz", "Get active", "Truth or Dare"];

  final List<String> _levels = ["Normal", "Extreme", "Dirty"];
  final List<String> _cups = ["6", "10"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Beer Pong Rules"),
          backgroundColor: Colors.black12,
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: 40),
            Text("Number of cups:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  color: Colors.white,
                  fillColor: Color.fromRGBO(188, 188, 188, 1),
                  selectedColor: Color.fromRGBO(0, 0, 0, 1),
                  borderRadius: BorderRadius.circular(10),
                  children: _cups.map((cup) => Text(cup)).toList(),
                  isSelected: _cups.map((cup) => cup == _numberOfCups).toList(),
                  onPressed: (index) {
                    setState(() {
                      _numberOfCups = _cups[index];
                    });
                  },
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
                  child: Text(
                    "Allow reracks",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              isSelected: [_reracksEnabled],
              onPressed: (index) {
                setState(() {
                  _reracksEnabled = !_reracksEnabled;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              "Select a challenge:",
              style: TextStyle(
                  fontSize: 20,
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
                      child: Text(challenge),
                    );
                  }).toList(),
                  isSelected: _challenges.map((challenge) => challenge == _selectedChallenge).toList(),
                  onPressed: (index) {
                    setState(() {
                      _selectedChallenge = _challenges[index];
                    });
                  },
                ),
            SizedBox(height: 20),
            Text(
              "Select a level:",
              style: TextStyle(
                  fontSize: 20,
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
                      child: Text(level),
                    );
                  }).toList(),
                  isSelected: _levels.map((level) => level == _selectedLevel).toList(),
                  onPressed: (index) {
                    setState(() {
                      _selectedLevel = _levels[index];
                    });
                  },
                )
                ,
            SizedBox(height: 140),
            
                ElevatedButton(
              child: Text("Start game"),
              onPressed: () {
                Navigator.pushNamed(context, GameboardScreen.routeName);
              },
            ),
          ]),
        ));
  }
}
