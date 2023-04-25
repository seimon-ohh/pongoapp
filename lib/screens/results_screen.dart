import 'dart:math';

import 'package:flutter/material.dart';
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

  void showPunishmentPopup(String punish) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$punish !'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  showButton = false;
                  showFortuneWheel = false;
                  ;
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
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.black12,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            "Der Gewinner ist ${widget.winnerTeamName}",
            style: TextStyle(color: Colors.white),
          ),
          if (widget.gamemode != "Tauziehen") ...[
            SizedBox(height: 10),
            Text(
              "Spieldauer  min",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              "Ergebnis ",
              style: TextStyle(color: Colors.white),
            ),
          ],
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: onPress,
            child: Text("Bestrafungszeit!"),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: showFortuneWheel
                  ? FortuneWheelWidget(selected: (punish) {
                      showPunishmentPopup(punish);
                    })
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
