import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pongoapp/providers/gamedata_provider.dart';
import 'package:provider/provider.dart';

import '../helpers/locator.dart';

class BeerPongField extends StatefulWidget {
  final int cups;
  int _elapsedSeconds = 0;

  BeerPongField({required this.cups});

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


  void _onButtonPress(
      ValueNotifier<Color> colorNotifier, GameDataProvider gameDataProvider) {
    List<String> questionAndAnswer = getQuestionAndAnswer(1);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(gameDataProvider.gameData.challenges),
          content: Column(

            children: [
              Text("Question: ${questionAndAnswer[0]}"),
              Text("Answer: ${questionAndAnswer[1]}")
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    colorNotifier.value = Colors.white10;
  }

  Widget _buildCup(GameDataProvider gameDataProvider) {
    ValueNotifier<Color> colorNotifier = ValueNotifier<Color>(Colors.red);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ValueListenableBuilder<Color>(
        valueListenable: colorNotifier,
        builder: (context, color, _) {
          return ElevatedButton(
            onPressed: () => _onButtonPress(colorNotifier, gameDataProvider),
            child: Text(''),
            style: ElevatedButton.styleFrom(
              primary: color,
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
