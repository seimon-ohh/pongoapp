
class GameData {
  String gamemode;
  List <String> team1;
  List <String> team2;
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
  });
}
