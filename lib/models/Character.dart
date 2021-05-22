class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Map<String, String> origin;
  final Map<String, String> location;
  final String image;
  final List<String> episode;
  final String url;

  Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin: Map<String, String>.from(json['origin']),
        location: Map<String, String>.from(json['location']),
        image: json['image'],
        episode: List<String>.from(json['episode']),
        url: json['url']);
  }
}
