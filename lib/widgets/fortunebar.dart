import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:provider/provider.dart';

import '../providers/gamedata_provider.dart';

class FortuneBarWidget extends StatelessWidget {

  StreamController<int> controller = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    final gameDataProvider = Provider.of<GameDataProvider>(
        context, listen: false);
    List<String> team1 = gameDataProvider.gameData.team1;
    List<String> team2 = gameDataProvider.gameData.team2;

    List<FortuneItem> fortuneItems = [
      ...team1.map((member) => FortuneItem(child: Text(member))),
      ...team2.map((member) => FortuneItem(child: Text(member))),
    ];

    final random = Random();
    final selected = fortuneItems.elementAt(
        random.nextInt(fortuneItems.length));
    final selectedIndex = fortuneItems.toList().indexOf(selected);
    controller.add(selectedIndex);

    // Aufrufen von updateBeginner, um die zufällig ausgewählte Person zu speichern
    String? selectedBeginner = (fortuneItems.elementAt(selectedIndex).child as Text).data;
    gameDataProvider.updateBeginner(selectedBeginner!);

    return FortuneBar(selected: controller.stream, items: fortuneItems);
  }
}
