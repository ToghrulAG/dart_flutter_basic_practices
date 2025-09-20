import 'package:basic_practices/features/characters/data/character_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/characters_bloc.dart';
import '../bloc/character_event.dart';
import '../bloc/character_state.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CharactersBloc(CharacterService())..add(LoadCharactersEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Characters')),
        body: BlocBuilder<CharactersBloc, CharacterState>(
          builder: (context, state) {
            if (state is CharacterLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CharacterLoaded) {
              return ListView.builder(
                itemCount: state.characters.length,
                itemBuilder: (context, index) {
                  final character = state.characters[index];
                  return ListTile(
                    title: Text(character.name),
                    subtitle: Text(character.status),
                  );
                },
              );
            } else if (state is CharacterError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('Press button to load characters'));
          },
        ),
      ),
    );
  }
}
