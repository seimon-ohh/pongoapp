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

  Future<bool> showExitConfirmationDialog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sind Sie sicher, dass Sie den Bildschirm verlassen möchten?\n \nDas aktuelle Spiel wird somit beendet!', style: TextStyle(fontSize: 12),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Ja',style: TextStyle(fontSize: 12),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Nein',style: TextStyle(fontSize: 12),),
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
              BeerPongField(
                cups: gameDataProvider.gameData.numberOfCups,
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
            ],
          ),
        ),
      ),
    );
  }
}
