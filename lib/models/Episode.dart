class Episode {
  Episode(
      {required this.id,
      required this.name,
      required this.episode,
      required this.air_date,
      required this.characters,
      required this.url});
  final int id;
  final String name;
  final String episode;
  final String air_date;
  final List<String> characters;
  final String url;

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['id'],
      name: json['name'],
      episode: json['episode'],
      air_date: json['air_date'],
      characters: List<String>.from(json['characters']),
      url: json['url'],
    );
  }
}
