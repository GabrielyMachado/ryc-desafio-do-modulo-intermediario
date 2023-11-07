import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_characters/store/characters_store.dart';
import 'package:marvel_characters/widgets/characters_list.dart';
import 'package:marvel_characters/widgets/custom_appbar.dart';

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

    return Observer(
      builder: (_) {
        if (_controller.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: CustomAppBar(controller: _controller),
            body: _controller.hasError
                ? RequestError(_controller.getCharacters, 'characters')
                : Stack(
                    children: [
                      _controller.foundCharacters.isNotEmpty
                          ? CharactersList(_controller)
                          : const Center(
                              child: Text('Nenhum personagem encontrado'),
                            )
                    ],
                  ),
          );
        }
      },
    );
  }
}
