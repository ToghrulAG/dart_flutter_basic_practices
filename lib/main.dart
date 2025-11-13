import 'package:basic_practices/features/characters/bloc/character_event.dart';
import 'package:basic_practices/features/characters/data/character_service.dart';
import 'package:basic_practices/features/characters/bloc/characters_bloc.dart';
import 'package:flutter/material.dart';
import 'package:basic_practices/routes/routes.dart';
import 'core/presentation/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => CharactersBloc(service: CharactersService())..add(LoadCharactersEvent()),
      child: const PracticeApp(),
    ),
  );
}

class PracticeApp extends StatelessWidget {
  const PracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice App',
      home: const HomeScreen(),
      routes: routes,
    );
  }
}