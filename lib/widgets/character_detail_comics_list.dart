import 'package:flutter/material.dart';
import 'package:marvel_characters/store/character_detail_store.dart';

import 'comics_card.dart';

class CharacterDetailComicsList extends StatelessWidget {
  final CharacterDetailStore _controller;

  const CharacterDetailComicsList(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        _controller.allCharacterComics.length,
        (index) => ComicCard(
          _controller.allCharacterComics[index],
        ),
      ),
    );
  }
}
