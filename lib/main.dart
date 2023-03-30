import 'package:flutter/material.dart';
import './Gamemodes.dart';

void main() => runApp(BeerPongApp());

class BeerPongApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pongo Startseite',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pongo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Willkommen bei Pongo!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/Pongo.png',
                height: 200,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return Gamemodes();
                  }));
                },
                child: Text('Spiel starten'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Hier kann die Aktion hinzugefügt werden, um die Spielregeln anzuzeigen
                },
                child: Text('Premium-Version kaufen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
