class GameData {
  String gamemode;
  int numberOfCups;
  bool allowReracks;
  String challenges;
  String level;
  List<String> team1;
  List<String> team2;
  String beginner;
  Map<String, int>? remainingCups;

  GameData({
    required this.gamemode,
    required this.numberOfCups,
    required this.allowReracks,
    required this.challenges,
    required this.level,
    required this.team1,
    required this.team2,
    required this.beginner,
  }) {
    remainingCups = {
      'team1': numberOfCups,
      'team2': numberOfCups,
    };
  }
}
