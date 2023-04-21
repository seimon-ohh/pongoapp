import 'package:flutter/cupertino.dart';

import '../models/game_data.dart';

class GameDataProvider extends ChangeNotifier {
  GameData _gameData = GameData(
    gamemode: "",
    numberOfCups: 6,
    allowReracks: false,
    challenges: "",
    level: "",
    team1: [],
    team2: [],
    beginner:"",
  );

  GameData get gameData => _gameData;

  void updateGamemode(String newGamemode) {
    _gameData.gamemode = newGamemode;
    notifyListeners();
  }
  void updateTeamList1(List <String> newTeamList) {
    _gameData.team1 = newTeamList;
    notifyListeners();
  }
  void updateTeamList2(List <String> newTeamList) {
    _gameData.team2 = newTeamList;
    notifyListeners();
  }
  void updateNumberOfCups(int newNumber) {
    _gameData.numberOfCups = newNumber;
    notifyListeners();
  }
void updateAllowReracks (bool newBool){
    _gameData.allowReracks = newBool;
}
void updateChallenges(String newChallengesType){
    _gameData.challenges = newChallengesType;
}
void updateLevel (String newLevel){
    _gameData.level=newLevel;
}
void updateBeginner (String beginner){
    _gameData.beginner = beginner;
}


}
