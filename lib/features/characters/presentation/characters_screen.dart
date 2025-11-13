import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/characters_bloc.dart';
import '../bloc/character_event.dart';
import '../bloc/character_state.dart';
import '../data/character_service.dart';
import '../data/character_model.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late CharactersBloc _bloc;
  final ScrollController _scrollController = ScrollController();

  void initState() {
    super.initState();

    _bloc = CharactersBloc(service: CharactersService());
    _bloc.add(LoadCharactersEvent());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _bloc.add(LoadCharactersEvent());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ricky Morty Characters'),
          backgroundColor: Colors.green,
        ),
        body: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            if (state is CharactersInitial || state is CharactersLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CharactersError) {
              return Center(child: Text('Ошибка: ${state.message}'));
            }
            if (state is CharactersLoaded) {
              final characters = state.characters;

              return ListView.builder(
                controller: _scrollController,
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  return _buildCharacterItem(character);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

Widget _buildCharacterItem(CharactersModel character) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(character.image)),
      title: Text(character.name),
      subtitle: Text('${character.species} - ${character.status}'),
    ),
  );
}



























