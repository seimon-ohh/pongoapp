import 'package:flutter/material.dart';


import '../models/teammember.dart';
import 'gamemode_screen.dart';
import 'gamerules_screen.dart';

class TeamListsWidget extends StatefulWidget {
  static const routeName = '/teamlist-screen';

  @override
  _TeamListsWidgetState createState() => _TeamListsWidgetState();
}

class _TeamListsWidgetState extends State<TeamListsWidget> {
  final TextEditingController _team1Controller = TextEditingController();
  final TextEditingController _team2Controller = TextEditingController();
  final List<String> _team1Members = [];
  final List<String> _team2Members = [];

  void _addMemberToTeam1() {
    setState(() {
      _team1Members.add(_team1Controller.text);
      _team1Controller.clear();
    });
  }

  void _addMemberToTeam2() {
    setState(() {
      _team2Members.add(_team2Controller.text);
      _team2Controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Teams"),
          backgroundColor: Colors.black12,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: TextField(
                  controller: _team1Controller,
                  decoration: InputDecoration(labelText: 'Team 1 Member'),
                ),
                trailing: ElevatedButton(
                  onPressed: _addMemberToTeam1,
                  child: Text('Add'),
                ),
              ),
              ListTile(
                title: TextField(
                  controller: _team2Controller,
                  decoration: InputDecoration(labelText: 'Team 2 Member'),
                ),
                trailing: ElevatedButton(
                  onPressed: _addMemberToTeam2,
                  child: Text('Add'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Team 1', style: TextStyle(fontSize: 20)),
              ),
              for (String member in _team1Members) Text(member),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Team 2', style: TextStyle(fontSize: 20)),
              ),
              for (String member in _team2Members) Text(member),
    ElevatedButton(
    onPressed: () {
    Navigator
        .pushNamed(context, BeerPongRulesPage.routeName);
    },
    child: Text('Next'),
    )
            ],
          ),
        ));
  }
}
