import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pongoapp/widgets/gamemode_carousel.dart';

class GamemodeScreen extends StatelessWidget {
  static const routeName = '/gamemode-screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spielmodus auswählen',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Spielmodus auswählen'),
        ),
        body: Center(
          child: GamemodeCarousel(),
        ),
      ),
    );
  }
}
