import 'package:basic_practices/features/characters/presentation/character_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../features/characters/presentation/characters_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  int _selectedIndex = 0;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) {
      //     return const CharacterDetailsScreen();
      //   }));

      // }),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return const EpisodesScreen();
            // }));
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CharactersScreen();
                },
              ),
            );
          } else if (index == 2) {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return const LocationsScreen();
            // }));
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.tv), label: 'Episodes'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Characters'),
          NavigationDestination(
            icon: Icon(Icons.location_city),
            label: 'Locations',
          ),
        ],
      ),
      appBar: AppBar(title: const Text('Ricky and Morty Practice App')),
      body: Center(
        // child: SvgPicture.asset(
        //   'assets/images/homeCover.svg',
        //   width: 200,
        //   height: 200,
        // ),
      ),
    );
  }
}
