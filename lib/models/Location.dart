class Location {
  Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
  });
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
      residents: List<String>.from(json['residents']),
      url: json['url'],
    );
  }
}
