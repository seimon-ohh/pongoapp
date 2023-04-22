import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pongoapp/screens/teamlist_screen.dart';
import 'package:provider/provider.dart';

import '../providers/gamedata_provider.dart';

class GamemodeCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> gamemodes = [
    {
      'image': 'assets/images/classic.png',
      'title': 'Classic',
      'description':
          'Macht euch auf was gefasst! So habt ihr Bierpong noch nie erlebt! Wir zeigen euch, was bei einem Bierpong-Match alles möglich ist.',
      'isLocked': false,
    },
    {
      'image': 'assets/images/tauziehen.png',
      'title': 'Tauziehen',
      'description':
          'Triffst du den angezeigten Bescher, wird dieser in deiene Richtung verschoben. Es gewinnt derjenige, der es schafft den Becher komplett auf seine eigene Seite wandern zu lassen.',
      'isLocked': false,
    },
    {
      'image': 'assets/images/tictactoe.png',
      'title': 'Tic Tac Toe',
      'description':
          'Es wird abwechselnd geworfen. Wer zuerst 3 Becher in einer Reihe getroffen hat, gewinnt.',
      'isLocked': true,
    },
    {
      'image': 'assets/images/level.png',
      'title': 'Level',
      'description':
          'Es gibt drei Level mit unterschiedlichen Aufstellungen. Jedes Level besteht aus drei Bechern, die getroffen werden müssen. Wer zuerst alle 3 Level absolviert hat, gewinnt.',
      'isLocked': true,
    },
    {
      'image': 'assets/images/change.png',
      'title': 'Change',
      'description':
          'Werden auf einer Seite 2 Becher getroffen, stellen sich die Aufstellunen beider Seiten automatisch um.',
      'isLocked': true,
    },
    {
      'image': 'assets/images/memory.png',
      'title': 'Memory',
      'description':
          'Es gibt acht verschiedene Paare. Mit dem Treffen eines Bechers deckt man das versteckte Symbol auf. Wer als erstes mehr als vier Paare aufdeckt, hat gewonnen.',
      'isLocked': true,
    },
    {
      'image': 'assets/images/dart.png',
      'title': 'Darts',
      'description':
          'Jeder Becher bringt eine andere Anzahl an Punkten. trifft man einen Becher werden diese Punkte abgezogen. Wer als erstes genau bei null ist, hat gewonnen.',
      'isLocked': true,
    },
    // Add more gamemodes as needed
  ];

  @override
  Widget build(BuildContext context) {
    final gameDataProvider =
        Provider.of<GameDataProvider>(context, listen: false);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CarouselSlider.builder(
            itemCount: gamemodes.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color.fromARGB(255, 42, 42, 42),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      gamemodes[index]['image'],
                      height: 150,
                    ),
                    Text(
                      gamemodes[index]['title'],
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      gamemodes[index]['description'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Minecraft",
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: gamemodes[index]["isLocked"]
                          ? null
                          : () {
                              gameDataProvider
                                  .updateGamemode(gamemodes[index]['title']);
                              Navigator.pushNamed(
                                  context, TeamListsWidget.routeName);
                            },
                      child: Text("Choose"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            gamemodes[index]["isLocked"] ? Colors.grey : null,

                      ),
                    )
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: 380.0,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 3),
              viewportFraction: 0.8,
              enlargeCenterPage: true,
            ),
          ),
        ]);
  }
}
