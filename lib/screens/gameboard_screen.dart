import 'package:flutter/material.dart';
import 'package:pongoapp/widgets/beerpongfield_widget.dart';

class GameboardScreen extends StatelessWidget {
  static const routeName= "/gameboard-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BeerPongField(cups: 6),
    );
  }
}