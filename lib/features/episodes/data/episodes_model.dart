class EpisodesModel {
  final int id;
  final String name;
  final DateTime airDate;
  final List<String> charactersUrl;
  final String episode;
  final DateTime created;

  EpisodesModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.charactersUrl,
    required this.episode,
    required this.created,
  });
  factory EpisodesModel.fromJson(Map<String, dynamic> json) {
    return EpisodesModel(
      id: json['id'],
      name: json['name'],
      airDate: json['airDate'],
      charactersUrl: List<String>.from(json['charactersUrl']),
      episode: json['episode'],
      created: json['created'],
    );
  }
}
