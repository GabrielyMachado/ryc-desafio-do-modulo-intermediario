import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_characters/entities/character.dart';
import 'package:marvel_characters/store/character_detail_store.dart';
import 'package:marvel_characters/widgets/show_more_button.dart';

import 'character_detail_comics_list.dart';

class CharacterDetailComics extends StatelessWidget {
  final Character character;
  final CharacterDetailStore _controller;

  const CharacterDetailComics(this.character, this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Presente em ${character.totalAvailableComics} ${character.totalAvailableComics > 1 ? 'quadrinhos' : 'quadrinho'}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CharacterDetailComicsList(_controller),
            _controller.hasMoreData
                ? ShowMoreButton(
                    () => _controller.showMoreCharacterComics(character.id),
                    _controller.loadingMore,
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
