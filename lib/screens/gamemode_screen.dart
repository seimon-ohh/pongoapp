import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pongoapp/screens/teamlist_screen.dart';
import 'package:pongoapp/widgets/gamemode_carousel.dart';

class GamemodeScreen extends StatelessWidget {
  static const routeName = '/gamemode-screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spielmodus auswählen',
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 55, 50, 50)),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gamemode"),
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
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, TeamListsWidget.routeName);
                },
                child: Text("Start"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
