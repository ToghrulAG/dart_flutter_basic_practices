import 'package:flutter/material.dart';
import '../data/character_model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87, // затемнённый фон
      appBar: AppBar(
        title: Text(
          character.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w400,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6), // затемнение под контентом
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  character.image,
                  height: 250,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                character.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              _buildInfoList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoRow('Status', character.status),
        _infoRow('Gender', character.gender),
        _infoRow('Species', character.species),
      ],
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$title: ',
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}