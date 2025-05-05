import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Equips/equip.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'informacio_equip.dart';

class PaginaEquips extends StatefulWidget {
  final String equip;
  const PaginaEquips({super.key, required this.equip});

  @override
  _PaginaEquip createState() => _PaginaEquip();
}

class _PaginaEquip extends State<PaginaEquips> {
  
  List<Equip> equips = [];

  @override
  void initState() {
    super.initState();
    _fetchPersonatges();
  }
  
  Future<void> _fetchPersonatges() async {
    final urlExt = Uri.parse("https://vidalibarraquer.net/android/sports/${widget.equip}.json");
    final responseExt = await http.get(urlExt);

    final Map<String, dynamic> jsonMapExt = jsonDecode(responseExt.body);
    List<dynamic> teamsExt = jsonMapExt['teams'];
    List<Equip> equipsTots = [];
    
    for (var item in teamsExt) {
      String abrevation = item['team_abbreviation'];
      debugPrint(abrevation);
      final urlInt = Uri.parse("https://vidalibarraquer.net/android/sports/${widget.equip}/${abrevation.toLowerCase()}.json");
      final responseInt = await http.get(urlInt);

      final Map<String, dynamic> jsonMapInt = jsonDecode(responseInt.body);
      List<dynamic> teamsInt = jsonMapInt['data'];

      equipsTots.add(Equip.fromJson(item, teamsInt, widget.equip));
    }
    setState(() {
      equips = equipsTots;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equips ${widget.equip.toUpperCase()}'),
      ),
      body: ListView.builder(
              itemCount: equips.length,
              itemBuilder: (context, index) {
                var team = equips[index];
                return ListTile(
                  leading: Image.network(team.imatge, width: 50, height: 50), 
                  title: Text(team.team_name),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InformacioEquip(team:team, equip: widget.equip)) );
                  },
                );
              },
            ),
    );
  }
}

  