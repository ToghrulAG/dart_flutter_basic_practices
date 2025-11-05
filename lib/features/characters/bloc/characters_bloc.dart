import 'package:basic_practices/features/characters/data/character_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/character_service.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharactersBloc extends Bloc<CharacterEvent, CharactersState>{
  final CharacterService service;
  final List <CharacterModel> _allCharacters = [];

  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasNextPage = true;

  CharactersBloc({required this.service}) : super(CharactersInitial()) {
    on<LoadCharactersEvent>(_onLoadCharacters);
  }
  Future<void> _onLoadCharacters(
    LoadCharactersEvent event, Emitter<CharactersState> emit) async {
      if (_isLoading || !_hasNextPage) return;
      _isLoading = true;

      if(_currentPage == 1) {
        emit(CharactersLoading());
      }

      try {
        final response = await service.fetchCharacters(page: _currentPage);
        final newCharacters = response['characters'] as List<CharacterModel>;
        _hasNextPage = response['hasNextPage'] as bool;
        _allCharacters.addAll(newCharacters);
        _currentPage ++;
        emit(CharactersLoaded(List.from(_allCharacters)));
      } catch (e) {
        emit(CharactersError(e.toString()));
      } finally {
        _isLoading = false;
      }

    }

}