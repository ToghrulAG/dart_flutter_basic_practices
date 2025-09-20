import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/character_event.dart';
import '../bloc/character_state.dart';
import '../data/character_model.dart';
import '../data/character_service.dart';

class CharactersBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterService service;

  CharactersBloc(this.service) : super(CharacterInitial()) {
    on<LoadCharactersEvent>((event, emit) async {
      emit(CharacterLoading());
      try {
        final characters = await service.fetchCharacters();
        emit(CharacterLoaded(characters));
      } catch (e) {
        emit(CharacterError(e.toString()));
      }
    });
  }
}
