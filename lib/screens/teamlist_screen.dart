import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:pongoapp/screens/tauziehen_screen.dart';

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
      final snackBar = const SnackBar(
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
            title: const Text('Edit Team Member'),
            content: TextField(
              controller: _editController,
              decoration: const InputDecoration(
                labelText: 'Team Member',
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Save'),
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
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 0.5)),
        title: Text(member,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontFamily: "Minecraft")),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.white,
              onPressed: () => _editMemberDialog(context, member, teamMembers),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
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
        title: const Text("Teams"),
        backgroundColor: Colors.black12,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Team 1',
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
              ),
              for (String member in _team1Members)
                _buildMemberTile(context, member, _team1Members),
              ListTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                ),
                title: TextField(
                  controller: _team1Controller,
                  onSubmitted: (_) {
                    _addMemberToTeam1();
                  },
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Minecraft"),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: 'Teammitglied hinzufügen',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                trailing: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _team1Controller,
                  builder: (BuildContext context, TextEditingValue value,
                      Widget? child) {
                    return IconButton(
                      onPressed:
                          value.text.isNotEmpty ? _addMemberToTeam1 : null,
                      icon: Icon(Icons.add,
                          color: value.text.isNotEmpty
                              ? Colors.white
                              : Colors.grey),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.white,
                thickness: 2.0,
              ),
              const Padding(
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
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                ),
                title: TextField(
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Minecraft"),
                  controller: _team2Controller,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    labelText: 'Teammitglied hinzufügen',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  onSubmitted: (_) {
                    _addMemberToTeam2();
                  },
                  textInputAction: TextInputAction.done,
                ),
                trailing: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _team2Controller,
                  builder: (BuildContext context, TextEditingValue value,
                      Widget? child) {
                    return IconButton(
                      onPressed:
                          value.text.isNotEmpty ? _addMemberToTeam2 : null,
                      icon: Icon(Icons.add,
                          color: value.text.isNotEmpty
                              ? Colors.white
                              : Colors.grey),
                    );
                  },
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        onPressed: _team1Members.isNotEmpty && _team2Members.isNotEmpty
            ? () {
                gameDataProvider.updateTeamList1(_team1Members);
                gameDataProvider.updateTeamList2(_team2Members);
                if (gameDataProvider.gameData.gamemode == 'Classic') {
                  Navigator.pushNamed(context, BeerPongRulesPage.routeName);
                } else if (gameDataProvider.gameData.gamemode == 'Tauziehen') {
                  Navigator.pushNamed(context, TauziehenScreen.routeName);
                }
              }
            : () => _showSnackbar(context),
        label: const Text(
          'Weiter',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor:  Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
