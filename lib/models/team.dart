import 'player.dart';

class Team {
  final String nameFull;
  final String nameShort;
  final Map<String, Player> players;

  Team({required this.nameFull, required this.nameShort, required this.players});
}
