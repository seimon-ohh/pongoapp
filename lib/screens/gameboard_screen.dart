import 'package:flutter/material.dart';
import 'package:pongoapp/widgets/beerpongfield_widget.dart';
import 'package:provider/provider.dart';

import '../providers/gamedata_provider.dart';

class GameboardScreen extends StatelessWidget {
  static const routeName= "/gameboard-screen";

  @override
  Widget build(BuildContext context) {
    final gameDataProvider = Provider.of<GameDataProvider>(context, listen: false);
    print(gameDataProvider.gameData.numberOfCups);
    return Scaffold(
      body: BeerPongField(cups: gameDataProvider.gameData.numberOfCups),
    );
  }
}