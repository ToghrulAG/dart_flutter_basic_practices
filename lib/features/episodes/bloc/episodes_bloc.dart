import "../data/episodes_model.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/episodes_service.dart';
import '../bloc/episodes_event.dart';
import '../bloc/episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final EpisodeService service;

  List<EpisodesModel> _allEpisodes = [];

  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasNextPage = true;

  EpisodesBloc({required this.service}) : super(EpisodesInitial()) {
    on<LoadEpisodesEvent>(_onLoadEpisodes);
  }

  Future<void> _onLoadEpisodes(
    LoadEpisodesEvent event,
    Emitter<EpisodesState> emit,
  ) async {
    if (_isLoading || !_hasNextPage) return;
    _isLoading = true;

    if (_currentPage == 1) {
      emit(EpisodesLoading());
    }

    try {
      final response = await service.fetchEpisodes(page: _currentPage);

      final newEpisodes = response['results'] as List<EpisodesModel>;
      _hasNextPage = response['hasNextPage'];
      _allEpisodes.addAll(newEpisodes);
      _currentPage++;
      emit(EpisodesLoaded(List.from(_allEpisodes)));
    } catch (e) {
      emit(EpisodesError(e.toString()));
    } finally {
      _isLoading = false;
    }
  }
}
