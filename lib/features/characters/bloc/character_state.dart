import '../data/character_model.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharacterModel> characters;

  CharactersLoaded(this.characters); // Edited constructor
}

class CharactersError extends CharactersState {
  final String message;
  
  CharactersError(this.message);
}