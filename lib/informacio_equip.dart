import 'package:flutter/material.dart';
import 'Equips/equip.dart';

class InformacioEquip extends StatelessWidget {
  final Equip team;
  final String equip;
  InformacioEquip({required this.team, required this.equip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(team.team_name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network("https://vidalibarraquer.net/android/sports/$equip/${team.team_abbreviation.toLowerCase()}.png", width: 400, height: 400),
            SizedBox(height: 20),
            Text(
              "Titulos: ${team.titles}",
            ),
            Text(
              "Estadio del equip: ${team.team_stadium}"
            )
          ],
        ),
      ),
    );
  }
}
    