import 'package:flutter/material.dart';
import 'pagina_equips.dart';


class PaginaEsports extends StatelessWidget {
  const PaginaEsports({Key? key}) : super(key: key);

  List<Card> _buildGridCards(BuildContext context) {
    List<String> esports = ['mlb', 'mls', 'nba', 'nfl', 'nhl'];

    final ThemeData theme = Theme.of(context);
    return esports.map((esport) {
      
      return Card(
        child: InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaEquips(equip: esport)) ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 12 / 11,
                child: Image.network(
                  'https://www.vidalibarraquer.net/android/sports/$esport.png', width: 50, height: 50,
                ),
              ),
              Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        esport.toUpperCase(),
                        style: theme.textTheme.titleLarge,
                      ),
                      ]
                    )
               )
            ],
          ),
        )
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esports'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
    );
  }
}

