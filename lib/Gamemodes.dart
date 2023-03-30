import 'package:flutter/material.dart';

class Gamemodes extends StatelessWidget {
  final List<String> gameModes = [
    'Classic',
    'Tauziehen',
    'Tic Taco Toe',
    'Modus 4',
    'Modus 5',
    'Modus 6',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spielmodus auswählen',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Spielmodus auswählen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: gameModes
                .map(
                  (mode) => ElevatedButton(
                    onPressed: () {
                      // Hier kann die Aktion hinzugefügt werden, um den entsprechenden Spielmodus zu starten
                      print('Der ausgewählte Spielmodus ist $mode');
                    },
                    child: Text(mode),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
