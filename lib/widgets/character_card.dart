import 'package:flutter/material.dart';
import 'package:marvel_characters/entities/character.dart';
import 'package:marvel_characters/utils/app_routes.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            character.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        child: GestureDetector(
          child: Hero(
            tag: character.id,
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/placeholder.jpg'),
              image: NetworkImage(character.thumbnail),
              fit: BoxFit.cover,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.characterDetail,
              arguments: character,
            );
          },
        ),
      ),
    );
  }
}
