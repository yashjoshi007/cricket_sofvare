import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/team.dart';

class TeamPlayersList extends StatelessWidget {
  final Team team;

  TeamPlayersList({required this.team});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: team.players.length,
      itemBuilder: (context, index) {
        final playerId = team.players.keys.elementAt(index);
        final player = team.players[playerId];
        final isCaptain = player!.isCaptain ?? false;
        final isWicketKeeper = player.isKeeper ?? false;

        return ListTile(
          title: Text(
            '${player.fullName}${isCaptain ? ' (C)' : ''}${isWicketKeeper ? ' (Wk)' : ''}',
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
          subtitle: Text(
            'Position: ${player.position}',
            style: TextStyle(
              fontStyle: FontStyle.normal,
            ),
          ),
          trailing: isCaptain ? Icon(Icons.star) : isWicketKeeper ? Icon(Icons.back_hand_sharp) : null, // Display star icon for captain
        );
      },
    );
  }
}
