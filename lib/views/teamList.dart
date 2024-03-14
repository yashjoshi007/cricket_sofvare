import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/team.dart';
import '../repository/team_repo.dart';
import '../widgets/list.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TeamRepository _teamRepository = TeamRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Lists'),
      ),
      body: FutureBuilder(
        future: _teamRepository.fetchTeams(),
        builder: (context, AsyncSnapshot<List<Team>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final teams = snapshot.data!;
            return DefaultTabController(
              length: teams.length,
              child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: teams.map((team) => Tab(text: team.nameFull)).toList(),
                  ),
                ),
                body: TabBarView(
                  children: teams.map((team) => TeamPlayersList(team: team)).toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

