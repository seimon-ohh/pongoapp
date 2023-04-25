import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:pongoapp/helpers/audio_player.dart';
import 'package:pongoapp/providers/gamedata_provider.dart';
import 'package:pongoapp/screens/gameboard_screen.dart';
import 'package:pongoapp/screens/gamerules_screen.dart';
import 'package:pongoapp/screens/pricing_screen.dart';
import 'package:pongoapp/screens/results_screen.dart';
import 'package:pongoapp/screens/tauziehen_screen.dart';
import 'package:pongoapp/screens/teamlist_screen.dart';

import 'package:provider/provider.dart';

import 'screens/gamemode_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      ChangeNotifierProvider(
        create: (context) => GameDataProvider(),
        child: BeerPongApp(),
      ),
    );
  });
}



class BeerPongApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Pongo Startseite',
      theme: ThemeData(
        fontFamily: "PressStart",
        scaffoldBackgroundColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Stack(
          children: [
            //AudioPlayer(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Willkommen!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "PressStart",
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/Pongo.png',
                    height: 200,
                  ),
                  SizedBox(height: 20),
                  Builder(builder: (BuildContext innerContext) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.of(innerContext)
                            .pushNamed(GamemodeScreen.routeName);
                      },
                      child: Text('Spiel starten'),
                    );
                  }),
                  SizedBox(height: 10),
                  Builder(builder: (BuildContext innerContext) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.of(innerContext)
                            .pushNamed(PricingScreen.routeName);
                      },
                      child: const Text(
                        'Premium-Version kaufen',
                        style: TextStyle(fontSize: 10),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: FloatingActionButton(
                mini: true,
                backgroundColor: Color.fromRGBO(188, 188, 188, 1),
                onPressed: () {

                },
                child: Icon(
                  Icons.help_outline,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          collapsedFabSize: ExpandableFabSize.small,
          distance: 50,
          closeButtonStyle: ExpandableFabCloseButtonStyle(
              backgroundColor: Colors.grey, foregroundColor: Colors.black),
          backgroundColor: Color.fromRGBO(188, 188, 188, 1),
          foregroundColor: Colors.black,
          child: Icon(Icons.language),
          children: [
            FloatingActionButton.small(
              heroTag: null,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/germany_flag.jpeg"),
                      fit: BoxFit.cover,
                    )),
              ),
              onPressed: () {},
            ),
            FloatingActionButton.small(
              heroTag: null,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/uk_flag.png"),
                        fit: BoxFit.cover,
                      )),
                ),
                const Positioned(
                  top: 13,
                    left: 5,
                    child: Text(
                  "Soon",
                  style: TextStyle(
                      color: Colors.black, fontSize: 12, fontFamily: "Arial",fontWeight: FontWeight.bold),
                ))
              ]),
              onPressed: () {},
            ),
          ],
        ),
      ),

      routes: {
        GamemodeScreen.routeName: (ctx) => GamemodeScreen(),
        TeamListsWidget.routeName: (ctx) => TeamListsWidget(),
        BeerPongRulesPage.routeName: (ctx) => BeerPongRulesPage(),
        GameboardScreen.routeName: (ctx) => GameboardScreen(),
        TauziehenScreen.routeName: (ctx) => TauziehenScreen(),
        PricingScreen.routeName: (ctx) => PricingScreen(),
        ResultsScreen.routeName: (ctx) => ResultsScreen(winnerTeamName: '', gamemode: '',),
      }
    );
  }
}

