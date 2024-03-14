import 'package:ciecket_sofvare/repository/team_repo.dart';
import 'package:ciecket_sofvare/views/teamList.dart';
import 'package:ciecket_sofvare/widgets/list.dart';
import 'package:flutter/material.dart';

import 'models/team.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Data App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


