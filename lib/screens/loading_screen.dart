import 'dart:async';
import 'package:flutter/material.dart';

import 'package:pongoapp/screens/gameboard_screen.dart';
import 'package:pongoapp/screens/tauziehen_screen.dart';
import 'package:pongoapp/screens/teamlist_screen.dart';
import 'package:provider/provider.dart';

import '../providers/gamedata_provider.dart';

class LoadingOverlay extends StatefulWidget {
  static const routeName = "/loading-overlay";

  @override
  _LoadingOverlayState createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay> {
  bool _isLoading = true;

  @override
  void initState() {
    final gameDataProvider =
        Provider.of<GameDataProvider>(context, listen: false);
    super.initState();
    Timer(Duration(seconds: 2), () {
      String newRouteName = TeamListsWidget.routeName;

      Navigator.of(context).pushReplacementNamed(newRouteName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hier kann optional ein Hintergrund-Widget hinzugefügt werden, wenn benötigt
          _isLoading
              ? Container(
                  color: Colors.black54,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Colors.white,),
                        SizedBox(height: 20),
                        Text(

                          "Lade Challenges von Server...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
