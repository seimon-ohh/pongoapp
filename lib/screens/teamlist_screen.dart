import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../providers/gamedata_provider.dart';
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
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
    final gameDataProvider =
        Provider.of<GameDataProvider>(context, listen: false);

    void _showSnackbar(BuildContext context) {
      final snackBar = SnackBar(
        content: Text('Bitte Teammitglieder eintragen'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white60,
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void _editMemberDialog(
        BuildContext context, String member, List<String> teamMembers) async {
      TextEditingController _editController =
          TextEditingController(text: member);

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Edit Team Member'),
            content: TextField(
              controller: _editController,
              decoration: InputDecoration(
                labelText: 'Team Member',
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Save'),
                onPressed: () {
                  setState(() {
                    int index = teamMembers.indexOf(member);
                    teamMembers[index] = _editController.text;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Widget _buildMemberTile(
        BuildContext context, String member, List<String> teamMembers) {
      return ListTile(
        title:
            Text(member, style: TextStyle(color: Colors.white, fontSize: 16)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.white,
              onPressed: () => _editMemberDialog(context, member, teamMembers),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                setState(() {
                  teamMembers.remove(member);
                });
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Teams"),
        backgroundColor: Colors.black12,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Team 1',
                  style: TextStyle(fontSize: 20, color: Colors.blue)),
            ),
            for (String member in _team1Members)
              _buildMemberTile(context, member, _team1Members),
            ListTile(
              title: TextField(
                controller: _team1Controller,

                decoration: InputDecoration(
                  labelText: 'Team 1 Member',
                  labelStyle: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              trailing: IconButton(
                onPressed: _addMemberToTeam1,
                icon: const Icon(Icons.add),
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Divider(
              color: Colors.white,
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Team 2',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  )),
            ),
            for (String member in _team2Members)
              _buildMemberTile(context, member, _team2Members),
            ListTile(
              title: TextField(
                controller: _team2Controller,
                decoration: InputDecoration(
                    labelText: 'Team 2 Member',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    )),
              ),
              trailing: IconButton(
                onPressed: _addMemberToTeam2,
                icon: Icon(Icons.add),
                color: Colors.white,
              ),
            ),
            SizedBox(height: 150),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _team1Members.isNotEmpty && _team2Members.isNotEmpty
            ? () {
                gameDataProvider.updateTeamList1(_team1Members);
                gameDataProvider.updateTeamList2(_team2Members);
                Navigator.pushNamed(context, BeerPongRulesPage.routeName);
              }
            : () => _showSnackbar(context),
        label: Text(
          'Next',
          style: TextStyle(color: Colors.black),
        ),
        icon: Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        backgroundColor: Color.fromRGBO(188, 188, 188, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
