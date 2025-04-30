
class Equip{
  int team_id;
  String team_name;
  String team_abbreviation;
  String titles;
  String team_stadium;

  Equip({required this.team_id, required this.team_name, required this.team_abbreviation, required this.titles, required this.team_stadium});

  factory Equip.fromJson(Map<String, dynamic> jsonExt, List<dynamic> data) {
    return Equip(
      team_id: jsonExt['team_id'],
      team_name: jsonExt['team_name'],
      team_abbreviation: jsonExt['team_abbreviation'],
      titles: data[0]["titles"],
      team_stadium: data[0]["team_stadium"],
    );
  }
}