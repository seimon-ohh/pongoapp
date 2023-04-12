import 'package:flutter/material.dart';
import 'dart:math';


class Challenge extends StatelessWidget {


  final List<String> challengesNormal = [
    "Situps",
    "Liegestütz",
    "Plank",
    "Squats",
    "Handstand",
    "Salto"
  ];


  int getRandomIntBetween(int min, int max) {
    if (min > max) {
      throw ArgumentError('min muss kleiner oder gleich max sein.');
    }

    Random random = Random();
    int randomNumber = min + random.nextInt(max - min + 1);
    return randomNumber;
  }



  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      child: SizedBox(
        width: 300,
        height: 100,
        child: Center(child: Text(challengesNormal[getRandomIntBetween(0, challengesNormal.length-1)])),
      ),
    ));
  }
}
