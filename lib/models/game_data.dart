import 'package:flutter/cupertino.dart';
import 'package:pongoapp/models/teamlist.dart';

class GameData extends ValueNotifier<GameData> {
  String gamemode;
  TeamList team1;
  TeamList team2;
  int numberOfCups;
  bool allowReracks;
  String challenges;
  String level;

  GameData({
    required this.gamemode,
    required this.numberOfCups,
    required this.allowReracks,
    required this.challenges,
    required this.level,
    required this.team1,
    required this.team2,
  }) : super(GameData(
          gamemode: gamemode,
          numberOfCups: numberOfCups,
          allowReracks: allowReracks,
          challenges: challenges,
          level: level,
          team1: team1,
          team2: team2,
        ));
}
