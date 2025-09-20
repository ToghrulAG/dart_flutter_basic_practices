import 'dart:convert';
import './character_model.dart';
import 'package:http/http.dart' as http;


class CharacterService {
  final String baseUrl = 'https://rickandmortyapi.com/api';

  Future<List<CharacterModel>> fetchCharacters() async {

    final response = await http.get(Uri.parse('$baseUrl/character'));

    if(response.statusCode == 200) {

      final data = json.decode(response.body);

      final List characters = data['results']; //

      return characters.map((json)=> CharacterModel.fromJson(json)).toList();

    } else {

      throw Exception('Failed to load characters');

    }
  }
}
