import 'package:flutter/material.dart';
import 'package:pongoapp/models/teammember.dart';
import 'package:pongoapp/screens/gameboard_screen.dart';
import 'package:pongoapp/screens/gamerules_screen.dart';
import 'package:pongoapp/screens/teamlist_screen.dart';
import 'screens/gamemode_screen.dart';

void main() => runApp(BeerPongApp());

class BeerPongApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pongo Startseite',
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 55, 50, 50)),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Willkommen bei Pongo!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/Pongo.png',
                height: 200,
              ),
              SizedBox(height: 20),
              Builder(builder: (BuildContext innerContext) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.of(innerContext)
                        .pushNamed(GamemodeScreen.routeName);
                  },
                  child: Text('Start Game'),
                );
              }),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text('Premium-Version kaufen'),
              ),
            ],
          ),
        ),
      ),
      routes: {
        GamemodeScreen.routeName: (ctx) => GamemodeScreen(),
        TeamListsWidget.routeName: (ctx) => TeamListsWidget(),
        BeerPongRulesPage.routeName: (ctx) => BeerPongRulesPage(),
        GameboardScreen.routeName: (ctx) => GameboardScreen(),
      },
    );
  }
}
