import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:pongoapp/screens/gamemode_screen.dart';
import 'package:pongoapp/widgets/fortunewheel_widget.dart';

class ResultsScreen extends StatefulWidget {
  static const routeName = "/results-screen";
  final String winnerTeamName;
  final String gamemode;

  ResultsScreen({required this.winnerTeamName, required this.gamemode});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  bool showButton = true;
  bool showFortuneWheel = false;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void showPunishmentPopup(String punish) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bestrafung: $punish'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  showButton = false;

                });
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void onPress() {
      setState(() {
        showButton = false;
        showFortuneWheel = true;
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context)
              .pushReplacementNamed(GamemodeScreen.routeName),
        ),
        title: const Text(
          "Spiel beendet",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.black12,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:20),
                child: Column(
                  children: [
                    Text(
                      "Der Gewinner ist:",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "${widget.winnerTeamName}",
                      style: TextStyle(color: widget.winnerTeamName == 'Team 1' ? Colors.blue : Colors.red, fontSize: 24),
                    ),
                  ],
                ),
              ),
              if (widget.gamemode != "Tauziehen") ...[
                SizedBox(height: 30),
                Text(
                  "Spieldauer  min",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  "Ergebnis ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: onPress,
                child: Icon(Icons.gavel, color:Colors.white,size:60),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  height: 350,
                  width: 350,
                  color: Colors.black,
                  child: showFortuneWheel
                      ? FortuneWheelWidget(selected: (punish) {
                          showPunishmentPopup(punish);
                        })
                      : Center(
                          child: Text(
                            'Drücke den Button, um das Bestrafungsrad zu drehen',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Builder(builder: (BuildContext innerContext) {
                      return ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(innerContext)
                              .pushReplacementNamed("/");
                        },
                        icon: Icon(Icons.home, color: Colors.black),
                        label: Text('Home'),
                      );
                    }
                  ),
                  Builder(
                      builder: (BuildContext innerContext) {
                      return ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(innerContext)
                              .pushReplacementNamed(GamemodeScreen.routeName);
                        },
                        icon: Icon(Icons.refresh, color: Colors.black),
                        label: Text('Rematch'),
                      );
                    }
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              maxBlastForce: 10,
              minBlastForce: 5,
              emissionFrequency: 0.1,
              numberOfParticles: 20,
              gravity: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
