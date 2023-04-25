import 'package:flutter/material.dart';
import 'package:pongoapp/screens/gamemode_screen.dart';
import 'package:pongoapp/widgets/fortunewheel_widget.dart';

class ResultsScreen extends StatefulWidget {
  static const routeName = "/results-screen";
  final String winnerTeamName;
  final String gamemode;

  ResultsScreen({required this.winnerTeamName, required this.gamemode});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  String _winner = '';
  String _gameTime = '';
  String _result = '';

  void _spinWheel() {
    // Logik zum Drehen des FortuneWheelWidgets
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spiel beendet", style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.black12,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Winner: $_winner'),
          Text('Game Time: $_gameTime'),
          Text('Result: $_result'),
          ElevatedButton(
            onPressed: _spinWheel, // Verwenden Sie die _spinWheel-Methode statt FortuneWheelWidget()
            child: const Text('Spin the wheel'),
          ),
          const SizedBox(height: 20),
          FortuneWheelWidget(),
        ],
      ),
    );
  }
}

