import 'package:flutter/material.dart';
import 'package:marvel_characters/entities/character.dart';

class CharacterDetailDescription extends StatelessWidget {
  final Character character;

  const CharacterDetailDescription(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        character.description,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
