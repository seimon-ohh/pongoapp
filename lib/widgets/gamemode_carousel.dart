import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GamemodeCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> gamemodes = [
    {
      'title': 'Classic',
      'description':
          'Macht euch auf was gefasst! So habt ihr Bierpong noch nie erlebt! Wir zeigen euch, was bei einem Bierpong-Match alles möglich ist.',
    },
    {
      'title': 'Tauziehen',
      'description': 'Description for Gamemode 2',
    },
    {
      'title': 'Tic Tac Toe',
      'description': 'Description for Gamemode 3',
    },
    {
      'title': 'Level',
      'description': 'Description for Gamemode 3',
    },
    {
      'title': 'Change',
      'description': 'Description for Gamemode 3',
    },
    {
      'title': 'Memory',
      'description': 'Description for Gamemode 3',
    },
    {
      'title': 'Darts',
      'description': 'Description for Gamemode 3',
    },
    // Add more gamemodes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: gamemodes.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.blue,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: 200.0,
        autoPlay: false,
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 0.8,
        enlargeCenterPage: true,
      ),
    );
  }
}
