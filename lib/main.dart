import 'package:flutter/material.dart';
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
                    Navigator.pushNamed(innerContext, GamemodeScreen.routeName);
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
      routes: {GamemodeScreen.routeName: (ctx) => GamemodeScreen()},
    );
  }
}
