import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_characters/store/characters_store.dart';
import 'package:marvel_characters/widgets/show_more_button.dart';

import 'character_grid.dart';

class CharactersList extends StatelessWidget {
  final CharactersStore _controller;

  const CharactersList(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 3,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CharacterGrid(
              _controller.foundCharacters,
            ),
            _controller.hasMoreData
                ? Observer(
                    builder: (_) {
                      return ShowMoreButton(
                        _controller.showMoreCharacters,
                        _controller.loadingMore,
                      );
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
