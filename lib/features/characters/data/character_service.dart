import 'dart:convert';
import './character_model.dart';
import 'package:http/http.dart' as http;

class CharacterService {
  final String baseUrl = 'https://rickandmortyapi.com/api';

  Future<Map<String, dynamic>> fetchCharacters({int page = 1}) async {
    final response = await http.get(Uri.parse('$baseUrl/character?page=$page'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final List characters = data['results']; //

      return {
        'characters': characters
            .map((char) => CharacterModel.fromJson(char))
            .toList(),
        'hasNextPage': data['info']['next'] != null,
      };
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
