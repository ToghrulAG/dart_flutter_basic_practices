import '../features/characters/presentation/characters_screen.dart';
import '../features/episodes/presentation/episodes_screen.dart';
import '../features/locations/presentation/locations_screen.dart';

final routes = {
  '/episodes' : (context) => const EpisodesScreen(),
  '/characters' : (context) => const CharactersScreen(),
  'locations' : (context) => const LocationsScreen(),
};