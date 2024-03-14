import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/team.dart';
import '../models/player.dart';

class TeamRepository {
  Future<List<Team>> fetchTeams() async {
    try {
      final response = await http.get(Uri.parse('https://www.sportsadda.com/cricket/live/json/nzin01312019187360.json'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        final List<Team> teams = [];

        if (data.containsKey('Teams')) {
          final teamsData = data['Teams'];
          for (var teamId in teamsData.keys) {
            final teamData = teamsData[teamId];
            final Map<String, Player> players = {};

            if (teamData.containsKey('Players')) {
              final playersData = teamData['Players'];
              for (var playerId in playersData.keys) {
                final playerData = playersData[playerId];
                players[playerId] = Player(
                  fullName: playerData['Name_Full'],
                  position: playerData['Position'],
                  isCaptain: playerData['Iscaptain'] ?? false,
                  isKeeper: playerData['Iskeeper'] ?? false,
                );
              }
            }

            teams.add(Team(
              nameFull: teamData['Name_Full'],
              nameShort: teamData['Name_Short'],
              players: players,
            ));
          }
        }

        return teams;
      } else {
        throw Exception('Failed to fetch teams: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to fetch teams: $error');
    }
  }
}
