import 'package:flutter/material.dart';

import 'package:pongoapp/screens/teamlist_screen.dart';
import 'package:pongoapp/widgets/gamemode_carousel.dart';
import 'package:provider/provider.dart';

import '../providers/gamedata_provider.dart';

class GamemodeScreen extends StatelessWidget {
  static const routeName = '/gamemode-screen';

  @override
  Widget build(BuildContext context) {
    final gameDataProvider = Provider.of<GameDataProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Spielmodus"),
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GamemodeCarousel(),
            SizedBox(
              height: 40,
            ),

          ],
        ),
      ),
    );
  }
}
