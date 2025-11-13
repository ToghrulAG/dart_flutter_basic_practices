import '../data/episodes_model.dart';

abstract class EpisodesState {}

class EpisodesInitial extends EpisodesState {}

class EpisodesLoading extends EpisodesState {}

class EpisodesLoaded extends EpisodesState {
  final List<EpisodesModel> episodes;

  EpisodesLoaded(this.episodes);
}

class EpisodesError extends EpisodesState {
  final String message;
  EpisodesError(this.message);
}
