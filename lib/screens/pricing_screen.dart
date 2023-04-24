import 'package:flutter/material.dart';

class PricingScreen extends StatefulWidget {
  static const routeName = "/pricing-screen";

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pongo Premium 💎", style: TextStyle(fontSize: 16)),
          backgroundColor: Colors.black12,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Pakete'),
              Tab(text: 'Modis'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1
            Column(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,),
                  child: ListTile(
                    leading: Container(child: Image.asset('assets/images/Pongo_blk.png', height: 100),width: 50),
                    title: Text('Alle Modi'),
                    subtitle: Text('Schalte alle Modi frei.', style: TextStyle(fontSize: 12, fontFamily: "Minecraft")),
                    trailing: SizedBox(
                      width: 110,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              onPressed: () {},
                              child: Text('3,99€',style: TextStyle(fontSize:14)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,),
                  child: ListTile(
                    leading: Container(child: Image.asset('assets/images/Pongo_blk.png', height: 100),width: 50),
                    title: Text('Alle Spiele',maxLines: 1),
                    subtitle: Text('Schalte alle Spiele frei.', style: TextStyle(fontSize: 12, fontFamily: "Minecraft")),
                    trailing: SizedBox(
                      width: 110,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              onPressed: () {},
                              child: Text('2,99€',style: TextStyle(fontSize:14)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,),
                  child: ListTile(
                    leading: Container(child: Stack(children: [Image.asset('assets/images/Pongo_blk.png', height: 100),Image.asset('assets/images/levels_badge.png', height: 100),]),width: 50),
                    title: Text('Alle Level'),
                    subtitle: Text('Schalte alle Level frei.', style: TextStyle(fontSize: 12, fontFamily: "Minecraft")),
                    trailing: SizedBox(
                      width: 110,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              onPressed: () {},
                              child: Text('1,49€',style: TextStyle(fontSize:14)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  ),
                ),
              ],
            ),

            // Tab 2
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,),
                    child: ListTile(
                      leading: Container(child: Image.asset('assets/images/tictactoe_blk.png', height: 100),width: 50),
                      title: Text('TicTacToe', maxLines: 1),
                      subtitle: Text('Schalte den Modus Tic Tac Toe frei.', style: TextStyle(fontSize: 12, fontFamily: "Minecraft")),
                      trailing: SizedBox(
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('1,29€', style: TextStyle(fontSize:14),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,),
                    child: ListTile(
                      leading: Container(child: Image.asset('assets/images/levels_blk.png', height: 100),width: 50),
                      title: Text('Level'),
                      subtitle: Text('Schalte den Modus Level frei.',style: TextStyle(fontSize: 12, fontFamily: "Minecraft")),
                      trailing: SizedBox(
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('1,29€', style: TextStyle(fontSize:14),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,),
                    child: ListTile(
                      leading: Container(child: Image.asset('assets/images/change_blk.png', height: 100),width: 50),
                      title: Text('Change'),
                      subtitle: Text('Schalte den Modus Change frei.', style: TextStyle(fontSize: 12, fontFamily: "Minecraft")),
                      trailing: SizedBox(
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('1,29€', style: TextStyle(fontSize:14),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,),
                    child: ListTile(
                      leading: Container(child: Image.asset('assets/images/memory.png', height: 100),width: 50),
                      title: Text('Memory'),
                      subtitle: Text('Schalte den Modus Memory frei.', style: TextStyle(fontSize: 12, fontFamily: "Minecraft")),
                      trailing: SizedBox(
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('1,29€', style: TextStyle(fontSize:14),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,),
                    child: ListTile(
                      leading: Container(child: Image.asset('assets/images/dart.png', height: 100),width: 50),
                      title: Text('Darts'),
                      subtitle: Text('Schalte den Modus Darts frei.', style: TextStyle(fontSize: 12, fontFamily: "Minecraft")),
                      trailing: SizedBox(
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('1,29€', style: TextStyle(fontSize:14),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,),
                    child: ListTile(
                      leading: Container(child: Image.asset('assets/images/dart.png', height: 100),width: 50),
                      title: Text('Extreme'),
                      subtitle: Text('Schalte das Level Extreme frei.', style: TextStyle(fontSize: 12, fontFamily: "Minecraft")),
                      trailing: SizedBox(
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('0,99€', style: TextStyle(fontSize:14),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,),
                    child: ListTile(
                      leading: Container(child: Image.asset('assets/images/dart.png', height: 100),width: 50),
                      title: Text('Dirty'),
                      subtitle: Text('Schalte das Level Dirty frei.', style: TextStyle(fontSize: 12, fontFamily: "Minecraft")),
                      trailing: SizedBox(
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('0,99€', style: TextStyle(fontSize:14),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  }

