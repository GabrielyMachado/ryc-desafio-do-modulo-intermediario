import 'package:flutter/material.dart';
import 'package:marvel_characters/entities/character.dart';

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
          backgroundColor: const Color.fromARGB(255, 238, 23, 31),
          title: Text(character.name),
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
            // TODO: Criar rota de navegação
          },
        ),
      ),
    );
  }
}
