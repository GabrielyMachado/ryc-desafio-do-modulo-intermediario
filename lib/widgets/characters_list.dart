import 'package:flutter/material.dart';
import 'package:marvel_characters/store/characters_store.dart';

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
                ? TextButton(
                    onPressed: () {
                      _controller.showMoreCharacters();
                    },
                    child: _controller.loadingMore
                        ? const CircularProgressIndicator()
                        : const Text(
                            'Mostrar mais',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
