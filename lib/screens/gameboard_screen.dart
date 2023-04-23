import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pongoapp/widgets/beerpongfield_widget.dart';
import 'package:provider/provider.dart';

import '../providers/gamedata_provider.dart';
import '../widgets/fortunebar.dart';

class GameboardScreen extends StatefulWidget {
  static const routeName = "/gameboard-screen";

  @override
  State<GameboardScreen> createState() => _GameboardScreenState();
}

class _GameboardScreenState extends State<GameboardScreen> {
  bool showButton = true;
  bool showFortuneBar = false;
  int _elapsedSeconds = 0;
  Timer? _timer;

  Future<bool> showExitConfirmationDialog() async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Sind Sie sicher, dass Sie den Bildschirm verlassen möchten?\n \nDas aktuelle Spiel wird somit beendet!',
                style: TextStyle(fontSize: 12),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    'Ja',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    'Nein',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  void showBeginnerPopup(String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$name beginnt!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  showButton = false;
                  showFortuneBar = false;
                  startTimer();
                });
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void dispose() {
    super.dispose();
    stopTimer();
  }

  @override
  Widget build(BuildContext context) {
    final gameDataProvider =
        Provider.of<GameDataProvider>(context, listen: false);

    void onPress() {
      setState(() {
        showButton = false;
        showFortuneBar = true;
      });
    }

    return WillPopScope(
      onWillPop: showExitConfirmationDialog,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Transform.rotate(
                angle: 3.14159265359,
                child: Text(
                  'Team 1 - ${gameDataProvider.gameData.numberOfCups} Becher übrig',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
              BeerPongField(
                cups: gameDataProvider.gameData.numberOfCups,
              ),
              Text(
                '${_elapsedSeconds ~/ 60}:${(_elapsedSeconds % 60).toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              showButton
                  ? ElevatedButton(
                      onPressed: onPress,
                      child: Text('Start Game'),
                    )
                  : showFortuneBar
                      ? FortuneBarWidget(
                          selected: (name) {
                            gameDataProvider.updateBeginner(name);
                            showBeginnerPopup(name);
                          },
                        )
                      : const SizedBox.shrink(),
              Transform.rotate(
                angle: 3.14159265359,
                child: BeerPongField(
                  cups: gameDataProvider.gameData.numberOfCups,
                ),
              ),
              Text(
                'Team 2 - ${gameDataProvider.gameData.numberOfCups} Becher übrig',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
