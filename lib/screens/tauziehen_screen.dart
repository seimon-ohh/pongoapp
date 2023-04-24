import 'package:flutter/material.dart';
import 'package:pongoapp/widgets/tauziehenfield_widget.dart';

class TauziehenScreen extends StatefulWidget {
  static const routeName = "/tauziehen-screen";
  @override
  State<TauziehenScreen> createState() => _TauziehenScreenState();
}

class _TauziehenScreenState extends State<TauziehenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tauziehen"),
          backgroundColor: Colors.black12,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Transform.rotate(
            angle: 3.14159265359,
            child: Container(
              width: MediaQuery.of(context).size.width,

              color: Colors.black,
              child: Center(
                child: Text(
                  'Team 1',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        CupGameWidget(),
        Center(
          child: Container(
            color: Colors.black,
            child: Text(
              'Team 2',
              style: TextStyle(
                color: Colors.red,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ],
      ));
  }
}
