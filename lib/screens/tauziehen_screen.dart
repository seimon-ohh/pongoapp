import 'package:flutter/material.dart';
import 'package:pongoapp/widgets/tauziehenfield_widget.dart';

class TauziehenScreen extends StatefulWidget {
  static const routeName = "/tauziehen-screen";
  @override
  State<TauziehenScreen> createState() => _TauziehenScreenState();
}

class _TauziehenScreenState extends State<TauziehenScreen> {

  Future<bool> showExitConfirmationDialog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Sind Sie sicher, dass Sie den Bildschirm verlassen möchten?\n \nDas aktuelle Spiel wird somit beendet!',
            style: TextStyle(fontSize: 12),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Ja',
                style: TextStyle(fontSize: 12),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'Nein',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        );
      },
    ) ??
        false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitConfirmationDialog,
      child: Scaffold(
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
        )),
    );
  }
}
