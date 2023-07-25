import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_characters/store/characters_store.dart';
import 'package:marvel_characters/widgets/character_grid.dart';
import 'package:marvel_characters/widgets/custom_appbar.dart';

import '../widgets/characters_error.dart';

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
            return CharacterError(_controller);
          } else if (_controller.foundCharacters.isNotEmpty) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SearchBar(
                    surfaceTintColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    hintText: 'Pesquisar personagem',
                    onChanged: (value) => _controller.runFilter(value),
                  ),
                ),
                Expanded(
                  child: CharacterGrid(_controller.foundCharacters),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('Nenhum personagem encontrado'),
            );
          }
        },
      ),
    );
  }
}
