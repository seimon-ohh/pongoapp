import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pongoapp/providers/gamedata_provider.dart';
import 'package:pongoapp/screens/gameboard_screen.dart';
import 'package:pongoapp/screens/gamerules_screen.dart';
import 'package:pongoapp/screens/teamlist_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screens/gamemode_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameDataProvider(),
      child: BeerPongApp(),
    ),
  );
}

class BeerPongApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pongo Startseite',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 55, 50, 50),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(188, 188, 188, 1),
                  foregroundColor: Colors.black))),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Willkommen bei Pongo!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
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
                    //erstelle Gamedata Objekt und gebe es dem gamemodescreen mit

                    Navigator.of(innerContext)
                        .pushNamed(GamemodeScreen.routeName);
                  },
                  child: Text('Start Game'),
                );
              }),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final Uri url =
                      Uri.parse('https://play.google.com/store/games');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw "Could not launch $url";
                  }
                },
                child: const Text('Premium-Version kaufen'),
              ),
            ],
          ),
        ),
      ),
      routes: {
        GamemodeScreen.routeName: (ctx) => GamemodeScreen(),
        TeamListsWidget.routeName: (ctx) => TeamListsWidget(),
        BeerPongRulesPage.routeName: (ctx) => BeerPongRulesPage(),
        GameboardScreen.routeName: (ctx) => GameboardScreen(),
      },
    );
  }
}
