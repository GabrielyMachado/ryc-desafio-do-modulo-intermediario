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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 238, 23, 31)),
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
