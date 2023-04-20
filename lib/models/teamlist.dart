import 'package:pongoapp/models/teammember.dart';

class TeamList {
  final List<TeamMember> members = [];

  void addMember(String name) {
    members.add(TeamMember(name));
  }
}
