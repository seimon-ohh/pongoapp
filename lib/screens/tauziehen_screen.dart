import 'package:flutter/material.dart';

class TauziehenScreen extends StatefulWidget {

  static const routeName = "/tauziehen-screen";
  @override
  State<TauziehenScreen> createState() => _TauziehenScreenState();
}

class _TauziehenScreenState extends State<TauziehenScreen> {
  int selectedCupIndex = 0;

  void moveCupUp() {
    setState(() {
      if (selectedCupIndex > 0) {
        selectedCupIndex--;
      }
    });
  }

  void moveCupDown() {
    setState(() {
      if (selectedCupIndex < 6) {
        selectedCupIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cups = List.generate(7, (index) {
      bool isSelected = index == selectedCupIndex;
      return Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedCupIndex = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? Colors.blue : Colors.grey[800],
            ),
            margin: EdgeInsets.all(10),
            height: isSelected ? 100 : 80,
            child: Center(
              child: Text(
                "Cup ${index + 1}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Tug of War"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: cups,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: moveCupUp,
                  icon: Icon(
                    Icons.arrow_upward,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: moveCupDown,
                  icon: Icon(
                    Icons.arrow_downward,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
