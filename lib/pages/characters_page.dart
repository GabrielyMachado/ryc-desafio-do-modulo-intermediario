import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_characters/store/characters_store.dart';
import 'package:marvel_characters/widgets/character_grid.dart';
import 'package:marvel_characters/widgets/custom_appbar.dart';
import 'package:marvel_characters/widgets/custom_searchbar.dart';

import '../widgets/request_error.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final _controller = CharactersStore();

  @override
  Widget build(BuildContext context) {
    if (!_controller.hasData) {
      _controller.getCharacters();
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Observer(
        builder: (_) {
          if (_controller.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (_controller.hasError) {
            return RequestError(_controller.getCharacters, 'characters');
          } else if (_controller.foundCharacters.isNotEmpty) {
            return Scrollbar(
              thickness: 3,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CustomSearchbar(_controller),
                    CharacterGrid(_controller.foundCharacters),
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
          } else {
            return Column(
              children: [
                CustomSearchbar(_controller),
                const Expanded(
                  child: Center(
                    child: Text('Nenhum personagem encontrado'),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
