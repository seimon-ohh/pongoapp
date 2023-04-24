import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pongoapp/providers/gamedata_provider.dart';
import 'package:provider/provider.dart';

class BeerPongField extends StatefulWidget {
  final int cups;
  final bool showButton;
  final bool showFortuneBar;
  final Color cupColor;
  final ValueNotifier<int> remainingCupsTeam1;
  final ValueNotifier<int> remainingCupsTeam2;

  BeerPongField({
    required this.cups,
    required this.showButton,
    required this.showFortuneBar,
    this.cupColor = Colors.red,
    required this.remainingCupsTeam1,
    required this.remainingCupsTeam2,
  });

  @override
  _BeerPongFieldState createState() => _BeerPongFieldState();
}

class _BeerPongFieldState extends State<BeerPongField> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    List<Map<String, dynamic>> fetchedData = await fetchDataFromFirestore();
    setState(() {
      data = fetchedData;
    });
  }

  Future<List<Map<String, dynamic>>> fetchDataFromFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collection = firestore.collection('gamedata');
    QuerySnapshot querySnapshot = await collection.get();
    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  int get pyramidSize {
    if (widget.cups == 6) {
      return 3;
    } else if (widget.cups == 10) {
      return 4;
    } else {
      throw ArgumentError('Cups must be 6 or 10.');
    }
  }

  final Random random = Random();

  List<String> getQuestionAndAnswer(int index) {
    if (data.isEmpty || data[0]["quiz"] == null) {
      return ["No quiz data available", ""];
    } else if (index < 0 || index >= data[0]["quiz"].length) {
      return ["Invalid index", ""];
    } else {
      Map<String, dynamic> quizEntry = data[0]["quiz"][index];
      String question = quizEntry["question"];
      String answer = quizEntry["answer"];
      return [question, answer];
    }
  }

  List<String> getTruthOrDare(int index) {
    if (data.isEmpty || data[0]["truthordare"] == null) {
      return ["No Truth or Dare data available", ""];
    } else if (index < 0 || index >= data[0]["truthordare"].length) {
      return ["Invalid index", ""];
    } else {
      Map<String, dynamic> truthOrDareEntry = data[0]["truthordare"][index];
      String truth = truthOrDareEntry["truth"];
      String dare = truthOrDareEntry["dare"];
      return [truth, dare];
    }
  }

  String getGetActive(int index) {
    if (data.isEmpty || data[0]["getactive"] == null) {
      return "No Get Active data available";
    } else if (index < 0 || index >= data[0]["getactive"].length) {
      return "Invalid index";
    } else {
      String getActiveEntry = data[0]["getactive"][index];
      return getActiveEntry;
    }
  }

  void _onButtonPress(
      ValueNotifier<Color> colorNotifier,
      GameDataProvider gameDataProvider,
      ValueNotifier<int> remainingCupsTeam1,
      ValueNotifier<int> remainingCupsTeam2,
      ) {
    if (colorNotifier.value == Colors.white10) {
      colorNotifier.value = widget.cupColor;
      String team = widget.cupColor == Colors.red ? 'team2' : 'team1';
      if (team == 'team1') {
        remainingCupsTeam1.value += 1;
      } else {
        remainingCupsTeam2.value += 1;
      }
    } else if (!widget.showButton && !widget.showFortuneBar) {
      String challengeType = gameDataProvider.gameData.challenges;

      int randomIndexQuiz = random.nextInt(data[0]["quiz"].length);
      int randomIndexTruthOrDare = random.nextInt(data[0]["truthordare"].length);
      int randomIndexGetActive = random.nextInt(data[0]["getactive"].length);

      Widget content;

      if (challengeType == "Quiz") {
        bool showAnswer = false;
        List<String> questionAndAnswer = getQuestionAndAnswer(randomIndexQuiz);
        content = StatefulBuilder(builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Frage:\n\n${questionAndAnswer[0]}",
                style: TextStyle(
                  fontFamily: "Minecraft",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              showAnswer
                  ? Text(
                "Antwort:\n ${questionAndAnswer[1]}",
                style: TextStyle(
                  fontFamily: "Minecraft",
                ),
              )
                  : TextButton(
                onPressed: () {
                  setState(() {
                    showAnswer = true;
                  });
                },
                child: Text("Antwort zeigen"),
              ),
            ],
          );
        });
      } else if (challengeType == "Truth or Dare") {
        List<String> truthAndDare = getTruthOrDare(randomIndexTruthOrDare);
        content = Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Wahrheit:\n${truthAndDare[0]}",
              style: TextStyle(
                fontFamily: "Minecraft",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Pflicht:\n${truthAndDare[1]}",
              style: TextStyle(
                fontFamily: "Minecraft",
              ),
            ),
          ],
        );
      } else if (challengeType == "Get active") {
        String getActive = getGetActive(randomIndexGetActive);
        content = Text(getActive,
            style: TextStyle(
              fontFamily: "Minecraft",
            ));
      } else {
        content = Text("Invalid challenge type");
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(challengeType),
            content: SizedBox(child: content),
            actions: <Widget>[
              TextButton(
                child: Text('Weiter'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      colorNotifier.value = Colors.white10;

      String team = widget.cupColor == Colors.red ? 'team2' : 'team1';
      if (team == 'team1') {
        remainingCupsTeam1.value -= 1;
      } else {
        remainingCupsTeam2.value -= 1;
      }
    }
  }



  Widget _buildCup(GameDataProvider gameDataProvider) {
    ValueNotifier<Color> colorNotifier = ValueNotifier<Color>(widget.cupColor);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ValueListenableBuilder<Color>(
        valueListenable: colorNotifier,
        builder: (context, color, _) {
          return ElevatedButton(
            onPressed: () => _onButtonPress(
              colorNotifier,
              gameDataProvider,
              widget.remainingCupsTeam1,
              widget.remainingCupsTeam2,
            ),
            child: Text(''),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: CircleBorder(),
              padding: EdgeInsets.all(16.0),
            ),
          );
        },
      ),
    );
  }


  List<Widget> _buildPyramid(GameDataProvider gameDataProvider) {
    List<Widget> pyramid = [];
    for (int row = 0; row < pyramidSize; row++) {
      List<Widget> rowContent = [];
      for (int col = 0; col < pyramidSize - row; col++) {
        rowContent.add(_buildCup(gameDataProvider));
      }
      pyramid.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0 * row),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: rowContent,
          ),
        ),
      );
    }
    return pyramid;
  }

  @override
  Widget build(BuildContext context) {
    final gameDataProvider =
        Provider.of<GameDataProvider>(context, listen: false);

    return Column(children: _buildPyramid(gameDataProvider));
  }
}
