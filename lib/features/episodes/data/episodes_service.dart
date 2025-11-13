import 'dart:convert';
import '../../episodes/data/episodes_model.dart';
import 'package:http/http.dart' as http;

class EpisodesService {
  final String baseUrl = 'https://rickandmortyapi.com/api/episode';

  Future<Map<String, dynamic>> fetchEpisodes({int page = 1}) async {
    final response = await http.get(Uri.parse('$baseUrl/episode?page=$page'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List episodesJson = data['results'];
      final episodes = episodesJson.map((e) => Episode.fromJson(e)).toList();

      return {'info': data['info'], 'episdodes': episodes};
    } else {
      throw Exception('Failed to load episodes');
    }
  }
}
