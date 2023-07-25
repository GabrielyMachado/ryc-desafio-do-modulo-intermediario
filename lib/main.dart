import 'package:flutter/material.dart';
import 'package:marvel_characters/pages/character_detail_page.dart';
import 'package:marvel_characters/pages/characters_page.dart';
import 'package:marvel_characters/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Personagens',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 238, 23, 31),
          primary: const Color.fromARGB(255, 238, 23, 31),
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 238, 23, 31),
          ),
        ),
        fontFamily: 'Roboto Condensed',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.home: (ctx) => const CharactersPage(),
        AppRoutes.characterDetail: (ctx) => const CharacterDetailPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
