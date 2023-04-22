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
  @override
  Widget build(BuildContext context) {
    final gameDataProvider =
        Provider.of<GameDataProvider>(context, listen: false);

    bool showButton = true;

    void onPress() {
      setState(() {
        showButton = false;
      });
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BeerPongField(
              cups: gameDataProvider.gameData.numberOfCups,
            ),
            if (showButton)
              ElevatedButton(
                onPressed: onPress,
                child: Text('Start Game'),
              ),
            if (!showButton) FortuneBarWidget(),
            Transform.rotate(
                angle: 3.14159265359,
                child: BeerPongField(
                  cups: gameDataProvider.gameData.numberOfCups,
                )),
          ],
        ),
      ),
    );
  }
}
