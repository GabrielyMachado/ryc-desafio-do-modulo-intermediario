import 'package:flutter/material.dart';
import 'package:marvel_characters/widgets/character_card.dart';

import '../entities/character.dart';

class CharacterGrid extends StatelessWidget {
  final List<Character> characters;

  const CharacterGrid(this.characters, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: characters.length,
      itemBuilder: (ctx, i) => CharacterCard(character: characters[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
