import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.tv), label: 'Episodes',),
          NavigationDestination(icon: Icon(Icons.person), label: 'Characters'),
          NavigationDestination(icon: Icon(Icons.location_city), label: 'Locations')
        ],
      ),
      appBar: AppBar(title: const Text('Ricky and Morty Practice App')),
      body: const Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}










// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0; // выбранная вкладка

//   // Список экранов
//   final List<Widget> _screens = const [
//     Center(child: Text('Episodes Screen')),
//     Center(child: Text('Characters Screen')),
//     Center(child: Text('Locations Screen')),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Rick and Morty Practice App')),

//       // Тело будет меняться в зависимости от выбранного индекса
//       body: _screens[_selectedIndex],

//       bottomNavigationBar: NavigationBar(
//         selectedIndex: _selectedIndex,
//         onDestinationSelected: (int index) {
//           setState(() {
//             _selectedIndex = index; // обновляем выбранный экран
//           });
//         },
//         destinations: const [
//           NavigationDestination(
//             icon: Icon(Icons.tv),
//             label: 'Episodes',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.person),
//             label: 'Characters',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.location_city),
//             label: 'Locations',
//           ),
//         ],
//       ),
//     );
//   }
// }