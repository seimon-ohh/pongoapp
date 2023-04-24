import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:pongoapp/screens/results_screen.dart';
import 'package:pongoapp/widgets/beerpongfield_widget.dart';
import 'package:provider/provider.dart';

import '../providers/gamedata_provider.dart';
import '../widgets/fortunebar.dart';
import 'dart:math' as math;

import '../widgets/timer_widget.dart';

class GameboardScreen extends StatefulWidget {
  static const routeName = "/gameboard-screen";

  @override
  State<GameboardScreen> createState() => _GameboardScreenState();
}

class _GameboardScreenState extends State<GameboardScreen> {
  bool showButton = true;
  bool showFortuneBar = false;
  late ConfettiController _confettiController;
  GlobalKey _confettiKey = GlobalKey();

  // Deklaration der ValueNotifier mit 'late'
  late ValueNotifier<int> remainingCupsTeam1;
  late ValueNotifier<int> remainingCupsTeam2;

  @override
  void initState() {
    super.initState();
    final gameDataProvider =
        Provider.of<GameDataProvider>(context, listen: false);
    remainingCupsTeam1 =
        ValueNotifier<int>(gameDataProvider.gameData.numberOfCups);
    remainingCupsTeam2 =
        ValueNotifier<int>(gameDataProvider.gameData.numberOfCups);
    _confettiController = ConfettiController(duration: Duration(seconds: 2));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (remainingCupsTeam1 == null || remainingCupsTeam2 == null) {
      final gameDataProvider =
          Provider.of<GameDataProvider>(context, listen: false);
      remainingCupsTeam1 =
          ValueNotifier<int>(gameDataProvider.getRemainingCups("team1"));
      remainingCupsTeam2 =
          ValueNotifier<int>(gameDataProvider.getRemainingCups("team2"));
    }
  }

  @override
  void dispose() {
    // Dispose ValueNotifier, um Ressourcen freizugeben
    remainingCupsTeam1.dispose();
    remainingCupsTeam2.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  void showWinnerDialog(String winnerTeam) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Spiel beendet!'),
          content: Container(height:150,child: Text('$winnerTeam hat gewonnen!')),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(ResultsScreen.routeName);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
    final gameDataProvider =
        Provider.of<GameDataProvider>(context, listen: true);

    void onPress() {
      setState(() {
        _confettiController.play();
        showButton = false;
        showFortuneBar = true;
      });
    }

    return WillPopScope(
      onWillPop: showExitConfirmationDialog,
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Transform.rotate(
                    angle: math.pi,
                    child: ValueListenableBuilder<int>(
                      valueListenable: remainingCupsTeam1,
                      builder: (context, value, child) {
                        return Text(
                          'Team 1 - $value Becher übrig',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        );
                      },
                    ),
                  ),
                  BeerPongField(
                    cups: gameDataProvider.gameData.numberOfCups,
                    showFortuneBar: showFortuneBar,
                    showButton: showButton,
                    cupColor: Colors.blue,
                    remainingCupsTeam1: remainingCupsTeam1,
                    remainingCupsTeam2: remainingCupsTeam2,
                  ),
                  SizedBox(
                    height: 140,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return SizedBox(
                                width: double.infinity,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  // Zentriert den gedrehten Text innerhalb der SizedBox
                                  child: !showButton && !showFortuneBar
                                      ? const GameTimer()
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: showButton
                                ? ElevatedButton(
                                    onPressed: onPress,
                                    child: Text(
                                      'Start',
                                    ),
                                  )
                                : showFortuneBar
                                    ? FortuneBarWidget(
                                        selected: (name) {
                                          gameDataProvider.updateBeginner(name);
                                          showBeginnerPopup(name);
                                        },
                                      )
                                    : const SizedBox.shrink(),
                          ),
                        ),
                        Expanded(flex: 2, child: Container()),
                      ],
                    ),
                  ),
                  Transform.rotate(
                    angle: 3.14159265359,
                    child: BeerPongField(
                      cups: gameDataProvider.gameData.numberOfCups,
                      showButton: showButton,
                      showFortuneBar: showButton,
                      remainingCupsTeam1: remainingCupsTeam1,
                      remainingCupsTeam2: remainingCupsTeam2,
                    ),
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: remainingCupsTeam2,
                    builder: (context, value, child) {
                      return Text(
                        'Team 2 - $value Becher übrig',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned.fill(
              key: _confettiKey,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirection: pi,
                // radial value - LEFT
                maxBlastForce: 10,
                minBlastForce: 2,
                emissionFrequency: 0.05,
                numberOfParticles: 50,
                gravity: 0.1,
              ),
            ),
            ValueListenableBuilder<int>(
              valueListenable: remainingCupsTeam1,
              builder: (context, value, child) {
                if (value == 0) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    showWinnerDialog("Team 1");
                  });
                }
                return Container(); // Rückgabe eines leeren Containers, um keine visuellen Auswirkungen zu haben
              },
            ),
            ValueListenableBuilder<int>(
              valueListenable: remainingCupsTeam2,
              builder: (context, value, child) {
                if (value == 0) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    _confettiController.play();
                    showWinnerDialog("Team 2");
                  });
                }
                return Container(); // Rückgabe eines leeren Containers, um keine visuellen Auswirkungen zu haben
              },
            ),
          ],
        ),
      ),
    );
  }
}
