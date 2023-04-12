import 'package:pongoapp/models/teamlist.dart';

class TeamList {
  final List<TeamMember> members = [];

  void addMember(String name) {
    members.add(TeamMember(name));
  }
}
